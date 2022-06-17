// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:drop_shadow/drop_shadow.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data: ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('city name: '+data['cityName']),
              Text('weather now: '+data['main']),
              Text('description: '+data['desc']),
              Text('Temperature: '+data['temp'].toString()+'°C'),
              Text('Feels like: '+ data['feelsLike'].toString()+'°C'),
              Text('Temperature maximum: '+data['tempMax'].toString()+'°C'),
              Text('Temperature minimum: '+data['tempMin'].toString()+'°C'),
              Text('Pressure: '+data['pressure'].toString()+' pa'),
              Text('Humidity: '+data['humidity'].toString()+' g.m-3'),
              Text('Wind speed: '+data['windSpeed'].toString()+' km/h'),
              Text('Wind degree: '+data['windDeg'].toString()+'°'),
              Text('Wind gust: '+data['windGust'].toString()),
              IconButton(onPressed: (){
                Navigator.pushNamed(context,'/location');
              }, icon: Icon(Icons.edit)),
            ],
          ),
        ),
      ),
    );
  }
}
