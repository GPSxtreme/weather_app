// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

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
              Text('Temperature: '+data['temp'].toString()),
              Text('Feels like: '+ data['feelsLike'].toString()),
              Text('Temperature maximum: '+data['tempMax'].toString()),
              Text('Temperature minimum: '+data['tempMin'].toString()),
              Text('Pressure: '+data['pressure'].toString()),
              Text('Humidity: '+data['humidity'].toString()),
              Text('Wind speed: '+data['windSpeed'].toString()),
              Text('Wind degree: '+data['windDeg'].toString()+'°'),
              Text('Wind gust: '+data['windGust'].toString()),
              IconButton(onPressed: (){
                Navigator.pushNamed(context,'/location');
              }, icon: Icon(Icons.arrow_back_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}
