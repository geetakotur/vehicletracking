import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:geo/Authentication.dart';
import 'package:geo/Login.dart';

import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value)=>Get.put(AuthController()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      title: "vehicle tracking",
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      home: loginApp(),
    );

  }
}









