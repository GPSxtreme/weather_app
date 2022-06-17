
import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/loading.dart';
import 'package:weather_app/pages/choose_location.dart';
import 'package:weather_app/pages/not_available.dart';

void main() => {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => const loading(),
        '/home':(context) => const home(),
        '/location':(context)=>const chooseLocation(),
        '/notAvailable':(context)=>const notAvailable(),
      },
    )
  )
};
