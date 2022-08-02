import 'package:canoe_app/Services/storage_services.dart';
import 'package:canoe_app/modal/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {


  LocationScreen({Key? key, }) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}



class _LocationScreenState extends State<LocationScreen> {
  void initState(){
    super.initState();

  }

  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(30.7333, 76.7794), zoom: 14);

  Set<Marker> markers = {};
  String? name;

  final StorageServices _services = StorageServices();



  getName()async{
  name = await _services.getUserName();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(

      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {

          Position position = await _determinePosition();

          googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));


          markers.clear();

          markers.add(Marker(markerId: const MarkerId('currentLocation'),infoWindow: InfoWindow(
            title:name ??"User",
          ),position: LatLng(position.latitude, position.longitude)));
          print(position);

          setState(() {});

        },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}



