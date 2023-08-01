import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:location/location.dart' as loc;


class MyMap extends StatefulWidget {
  final String user_id;
  final double geofenceLatitude;
  final double geofenceLongitude;
  final double geofenceRadius;
  final String phoneNumber; // New parameter for phone number

  MyMap({
    required this.user_id,
    required this.geofenceLatitude,
    required this.geofenceLongitude,
    required this.geofenceRadius,
    required this.phoneNumber, // New parameter for phone number
  });
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  final loc.Location location = loc.Location();
  late GoogleMapController _controller;
  bool _added = false;
  Circle? _circle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: {
          Marker(
            position: LatLng(
              widget.geofenceLatitude,
              widget.geofenceLongitude,
            ),
            markerId: MarkerId('geofenceMarker'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueMagenta,
            ),
          ),
        },
        circles: {
          if (_circle != null) _circle!,
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.geofenceLatitude,
            widget.geofenceLongitude,
          ),
          zoom: 14.47,
        ),
        onMapCreated: (GoogleMapController controller) async {
          setState(() {
            _controller = controller;
            _added = true;
          });
          // Create the circle to represent the geofencing area
          _createCircle();
          // Store the user's location and phone number in Firestore
          //_storeUserData();
        },
      ),
    );
  }

  void _createCircle() {
    _circle = Circle(
      circleId: CircleId('geofence'),
      center: LatLng(widget.geofenceLatitude, widget.geofenceLongitude),
      radius: widget.geofenceRadius,
      fillColor: Color.fromRGBO(255, 0, 0, 0.2),
      strokeWidth: 2,
      strokeColor: Colors.red,
    );
  }

//   void _storeUserData() async {
//     try {
//       // Store the user's location and phone number in Firestore
//       await FirebaseFirestore.instance.collection('users').doc(widget.user_id).set({
//         'latitude': widget.geofenceLatitude,
//         'longitude': widget.geofenceLongitude,
//         'radius': widget.geofenceRadius,
//         'phoneNumber': widget.phoneNumber, // Store the phone number
//       }, SetOptions(merge: true));
//     } catch (e) {
//       print('Error storing user data: $e');
//     }
//   }
}
