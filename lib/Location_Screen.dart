import 'dart:async';
import 'dart:typed_data';
import 'package:canoe_app/Services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' ;
import 'package:http/http.dart' as http;
import 'modal/location_modal.dart';
import 'dart:convert';





class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}
var DetailData=[];
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
        "images/car_icon.png");
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
          circleId: CircleId("car"),
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

  fetchLocation() async{
    var url = Uri.parse("https://4436-2401-4900-55b1-4260-a8f1-56a9-bcfd-91d9.in.ngrok.io/LatLong/:Email");
    http.Response response;
    response = await http.get(url);
    print(response.body);
    if(response.statusCode==200){
      var  jsonResponse= await json.decode(response.body);
      print(jsonResponse);
      DetailData=jsonResponse;


    }else{
      DetailData=[];
      throw Exception("error");
    }


  }




  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late Future<List<LocationModal>> _future;
  List markerList=[];
  

  @override

  void initState() {
    markerList.add(fetchLocation());
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    List<Marker>markersList =[
      Marker(markerId: MarkerId(DetailData[0]["_id"]),
          position: LatLng(double.tryParse(DetailData[0]["Latitude"])!,double.tryParse(DetailData[0]["Longitude"])!)),
      Marker(markerId: MarkerId(DetailData[1]["_id"]),
          position: LatLng(double.tryParse(DetailData[1]["Latitude"])!,double.tryParse(DetailData[1]["Longitude"])!)),
      Marker(markerId: MarkerId(DetailData[2]["_id"]),
          position: LatLng(double.tryParse(DetailData[2]["Latitude"])!,double.tryParse(DetailData[2]["Longitude"])!)),
      Marker(markerId: MarkerId(DetailData[3]["_id"]),
          position: LatLng(double.tryParse(DetailData[3]["Latitude"])!,double.tryParse(DetailData[3]["Longitude"])!))

    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: FutureBuilder<List<LocationModal>>(future: _future,
        builder: (context,snapshot){
          if (snapshot.hasData) {
            return Stack(
              children: [
                GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: initialLocation,
                  markers: Set.of((marker != null) ?Set<Marker>.of(markersList) : [

                  ]),
                  circles: Set.of((circle != null) ? [circle!] : []),
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                ),
              ],
            );
          }
          else if(snapshot.hasError){
            return Center(child: Text(
                "${snapshot.error}"
            ),
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      )

    );
  }
}
