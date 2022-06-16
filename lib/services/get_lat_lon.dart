// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:http/http.dart';

class get_lat_lon{
  Future<Map<dynamic,dynamic>> getLatLon(String cityName)async{
    late Map<dynamic,dynamic> result = {};
    String apiEndPoint = 'http://api.openweathermap.org/geo/1.0/direct?q=$cityName&appid=8bfd8626d5b14065bba3c261fb429535';
    Uri url = Uri.parse(apiEndPoint);
    Response response = await get(url);
    final List<dynamic> data = jsonDecode(response.body);
    if(data.isEmpty){
      result['lat'] = 'NA';
      result['lon'] = 'NA';
    }
    else  {
      result['lat'] = data[0]['lat'];
      result['lon'] = data[0]['lon'];
    }
    return result;
  }
}
//