import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' ;






class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  late GoogleMapController _controller;
  final _location = Location();
  late LatLng currentPostion;
  StreamSubscription? _locationSubscription;
  final Location _locationTracker = Location();
  Marker ?marker;
  Circle ?circle;
  bool ?value = false;


  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load(
        "assets/boat_icon.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude!, newLocalData.longitude!);
    setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading!,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("boat"),
          radius: newLocalData.accuracy!,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription!.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
            _controller.animateCamera(
                CameraUpdate.newCameraPosition(CameraPosition(
                    bearing: 192.8334901395799,
                    target: LatLng(
                        newLocalData.latitude!, newLocalData.longitude!),
                    tilt: 0,
                    zoom: 18.00)));
            updateMarkerAndCircle(newLocalData, imageData);
          });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription!.cancel();
    }

    super.dispose();
  }

  stop() {
    if (_locationSubscription != null) {
      setState(() {
        _locationSubscription = null;
      });
    }
  }


  int selectindex = 0;
  int select = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  _onitemtapped(int value) {
    setState(() {
      select = value;
    });
  }


  @override
  void initState() {
    super.initState();
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: initialLocation,
            markers: Set.of((marker != null) ? [marker!] : []),
            circles: Set.of((circle != null) ? [circle!] : []),
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
          ),
        ],
      ),

    );
  }


}
