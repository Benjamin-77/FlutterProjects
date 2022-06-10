import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Google Map'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  LatLng cotonou =LatLng(6.3724685, 2.3261369);
  LatLng paris =LatLng(48.866667, 2.333333);

  Location location = new Location();

  bool _serviceEnabled=true;

  _checkPermission()async{
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }


  final Marker _cotonouMarker = Marker(
    markerId: const MarkerId("Paris"),
    infoWindow: const InfoWindow(title: 'Paris'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: LatLng(6.4163797, 2.339388),
  );

  final Marker _parisMarker = Marker(
    markerId: const MarkerId("Paris"),
    infoWindow: const InfoWindow(title: 'Paris'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(6.4163797, 2.339388),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkPermission();
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("Localisation");
      print(currentLocation);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: GoogleMap(
        zoomControlsEnabled: true,
        mapType: MapType.satellite,
        markers: {
          _cotonouMarker,
          _parisMarker
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(6.4163797, 2.339388),
          zoom: 20
        ),
        onMapCreated: (GoogleMapController controller){

        },
      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
