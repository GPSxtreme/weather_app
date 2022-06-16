// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:http/http.dart';

class get_cities{

  Future<void> returnAllCities(Map<dynamic,dynamic> map)async{
    String apiEndPoint = 'https://countriesnow.space/api/v0.1/countries';
    Uri url = Uri.parse(apiEndPoint);
    Response response = await get(url);
    final data = jsonDecode(response.body) as Map<dynamic,dynamic>;
    final dynamic mainData = data['data'];
    for(int i =0 ; i<mainData.length ; i++){
      map[mainData[i]['country']] = mainData[i]['cities'];
    }
  }
}