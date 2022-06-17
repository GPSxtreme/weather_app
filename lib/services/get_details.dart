// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:http/http.dart';

class get_details {
  dynamic lat;
  dynamic lon;
  late String cityName;
  late String main;
  late String description;
  late dynamic temp;
  late dynamic feelsLike;
  late dynamic tempMax;
  late dynamic tempMin;
  late dynamic pressure;
  late dynamic humidity;
  late dynamic windSpeed;
  late dynamic windDeg;
  late dynamic windGust;
  //constructor
  get_details({required this.lat,required this.lon});
  //
  Future<int> check()async{
    late int result;
    try{
      String apiEndPoint = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=8bfd8626d5b14065bba3c261fb429535&units=metric';
      Uri url = Uri.parse(apiEndPoint);
      Response response = await get(url);
      Map data = jsonDecode((response.body));
      if(data['message'] != null && data['message'] == "wrong latitude" ){
        result = 0;
      }
      else {
        result = 1;
      }
    }
    catch(e){
      print(e);
    }
    return result;
  }
  Future<void> getDetails() async {
   try{
     //get data from weather api
     String apiEndPoint = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=8bfd8626d5b14065bba3c261fb429535&units=metric';
     Uri url = Uri.parse(apiEndPoint);
     Response response = await get(url);
     Map data = jsonDecode((response.body));

     //get properties from data
     cityName = data['name'] ?? 'Not available';
     main = data['weather'][0]['main'] ?? 'Not available';
     description = data['weather'][0]['description'] ?? 'Not available';
     temp = data['main']['temp'] ?? 'Not available';
     feelsLike = data['main']['feels_like'] ?? 'Not available';
     tempMin = data['main']['temp_min'] ?? 'Not available';
     tempMax = data['main']['temp_max'] ?? 'Not available';
     pressure = data['main']['pressure'] ?? 'Not available';
     humidity = data['main']['humidity'] ?? 'Not available';
     windSpeed = data['wind']['speed'] ?? 'Not available';
     windDeg =  data['wind']['deg'] ?? 'Not available';
     windGust =  data['wind']['gust'] ?? 'Not available';
   }
   catch(e){
     print(e);
   }
  }
}