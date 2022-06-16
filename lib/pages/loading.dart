// ignore_for_file: prefer_const_constructors, camel_case_types, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/get_details.dart';
import 'package:weather_app/pages/choose_location.dart';
import 'package:weather_app/services/get_cities.dart';
import 'package:weather_app/services/get_lat_lon_bulk.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  void setupCityDetails()async{
    await get_cities().returnAllCities(mainData);
    setupCityNames();
    get_details instance = get_details(lat: 17.6868,lon: 83.2185);
    await instance.getDetails();
    Navigator.pushReplacementNamed(context, '/home',arguments: {'cityName':instance.cityName,'main':instance.main,'desc':instance.description,'temp':instance.temp,'feelsLike':instance.feelsLike,'tempMax':instance.tempMax,'tempMin':instance.tempMin,'pressure':instance.pressure,'humidity':instance.humidity,'windSpeed':instance.windSpeed,'windDeg':instance.windDeg,'windGust':instance.windGust});
  }

  @override
  void initState(){
    super.initState();
    setupCityDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
