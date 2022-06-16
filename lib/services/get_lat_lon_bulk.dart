// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:http/http.dart';

class get_lat_lon_bulk{
  Future<void> getLatLonBulk(Map<dynamic,dynamic> map,Map<dynamic,dynamic> latLon)async{
    late String cityName;
    for (var element in map.keys) {
      for(int i=0;i<map[element].length;i++){
        cityName = map[element][i];
        String apiEndPoint = 'http://api.openweathermap.org/geo/1.0/direct?q=$cityName&appid=8bfd8626d5b14065bba3c261fb429535';
        Uri url = Uri.parse(apiEndPoint);
        Response response = await get(url);
        final List<dynamic> data = jsonDecode(response.body);
        print(0);
        if(data.isEmpty){
          latLon[cityName] = {
            'lat': 'NA',
            'lon':'NA'
          };
        }
        else  {
          latLon[cityName] = {
            'lat': data[0]['lat'],
            'lon':data[0]['lon']
          };
        }

      }
    }
  }
}