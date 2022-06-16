import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/loading.dart';
import 'package:weather_app/pages/choose_location.dart';

void main() => {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => const loading(),
        '/home':(context) => const home(),
        '/location':(context)=>const chooseLocation(),
      },
    )
  )
};
