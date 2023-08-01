import 'package:flutter/material.dart';

import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:html' as html;
import 'package:geo/mymap.dart';




import 'package:location/location.dart' as loc;

import 'package:permission_handler/permission_handler.dart'
if (dart.library.io) 'package:permission_handler/permission_handler.dart';
void main(){
  runApp(geo());
}

class geo extends StatefulWidget {
  const geo({Key? key}) : super(key: key);

  @override
  State<geo> createState() => _geoState();
}

class _geoState extends State<geo> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;

  final double geofenceLatitude = 15.4483; // Dharwad latitude
  final double geofenceLongitude = 75.0078; // Dharwad longitude
  final double geofenceRadius = 1000; // Geofence radius in meters

  late GoogleMapController _controller;
  bool _added = false;
  // Circle? _circle;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Location Tracker'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              _getLocation('7019534283');
            },
            child: Text('Add My Location'),
          ),
          TextButton(
            onPressed: () {
              _listenLocation();
            },
            child: Text('Enable Live Location'),
          ),
          TextButton(
            onPressed: () {
              _stopListening();
            },
            child: Text('Stop Live Location'),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('location').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data!.docs[index]['name'].toString()),
                      subtitle: Row(
                        children: [
                          Text(snapshot.data!.docs[index]['latitude'].toString()),
                          SizedBox(width: 20),
                          Text(snapshot.data!.docs[index]['longitude'].toString()),
                          // SizedBox(width: 20),
                          // Text(snapshot.data!.docs[index]['phoneNumber'].toString()),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.directions),
                        onPressed: () {
                          String phoneNumber = snapshot.data!.docs[index]['phoneNumber'].toString();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyMap(
                              user_id: snapshot.data!.docs[index].id,
                              geofenceLatitude: geofenceLatitude,
                              geofenceLongitude: geofenceLongitude,
                              geofenceRadius: geofenceRadius,
                              phoneNumber: phoneNumber, // Pass the actual phoneNumber here
                            ),
                          ));
                        },
                      ),

                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _getLocation(String phoneNumber) async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
        'name': 'bus',
        'phoneNumber':'7019534283'

      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': 'bus',
        'phoneNumber':'7019534283'
      }, SetOptions(merge: true));

      // Check if the user is inside the geofence
      double distanceFromGeofenceCenter = calculateDistanceFromGeofence(
        currentlocation.latitude!,
        currentlocation.longitude!,
      );

      if (distanceFromGeofenceCenter <= geofenceRadius) {
        // User is inside the geofence, trigger event here
        print('User is inside the geofence');
      } else {
        // User is outside the geofence, trigger event here
        print('User is outside the geofence');
      }
    });
  }

  double calculateDistanceFromGeofence(double latitude, double longitude) {
    // Calculate the distance between the user's location and the geofence center
    double distance = Geolocator.distanceBetween(
      latitude,
      longitude,
      geofenceLatitude,
      geofenceLongitude,
    );
    return distance;
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  Future<void> _requestPermission() async {
    try {
      final position = await html.window.navigator.geolocation.getCurrentPosition(
        enableHighAccuracy: true,
      );

      if (position != null) {
        print('Permission Granted');
        print('Latitude: ${position.coords?.latitude}');
        print('Longitude: ${position.coords?.longitude}');
      } else {
        print('Permission Denied');
      }
    } catch (e) {
      print('Error requesting permission: $e');
    }
  }
}

