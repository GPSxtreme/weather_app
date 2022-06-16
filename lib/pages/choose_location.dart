// ignore_for_file: prefer_const_constructors, camel_case_types, use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:weather_app/services/get_lat_lon.dart';
import 'package:weather_app/services/get_details.dart';

Map<dynamic,dynamic> mainData ={};
Map<dynamic,dynamic> cityLatLon={};
void setupCityNames(){
  cityNames = cityNames.toSet().toList();//to remove duplicates
  for(var e in mainData.keys){
    for(int i = 0;i<mainData[e].length;i++){
      cityNames.add(mainData[e][i]);
    }
  }
}
List<dynamic> cityNames=[];
class chooseLocation extends StatefulWidget {
  const chooseLocation({Key? key}) : super(key: key);

  @override
  State<chooseLocation> createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {

  Future<void> updateCity(String name)async{
    //get latitude and longitude
    Map latLon = await get_lat_lon().getLatLon(name);
    //navigate to home screen and send data
    get_details instance = get_details(lat: latLon['lat'],lon: latLon['lon']);
    await instance.getDetails();
    Navigator.pushReplacementNamed(context,'/home',arguments: {'cityName':name,'main':instance.main,'desc':instance.description,'temp':instance.temp,'feelsLike':instance.feelsLike,'tempMax':instance.tempMax,'tempMin':instance.tempMin,'pressure':instance.pressure,'humidity':instance.humidity,'windSpeed':instance.windSpeed,'windDeg':instance.windDeg,'windGust':instance.windGust});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Choose city(${cityNames.length})',style: TextStyle(color: Colors.indigo),),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: cityNames.length,
        itemBuilder: (context , index){
          return Card(
            color: Colors.white,
            child: ListTile(
              onTap: (){
                updateCity(cityNames[index]);
              },
              title: Text(cityNames[index],style: TextStyle(color: Colors.indigo,fontSize: 20),),
          ),
          );
        },
      ),
    );
  }
}
//search method

class CustomSearchDelegate extends SearchDelegate {
// first overwrite to
// clear the search text

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }
// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }
// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var location in cityNames) {
      if (location.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(location);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    void buildSearchList(){
      for (var location in cityNames) {
        if (location.toLowerCase().contains(query.toLowerCase())) {
          matchQuery.add(location);
        }
      }
      matchQuery = matchQuery.toSet().toList();
    }
    buildSearchList();
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
            title: Text(result),
            onTap: () async{
              //get lat lon
              Map latLon = await get_lat_lon().getLatLon(result);
              //navigate to home screen and sending data
              get_details instance = get_details(lat: latLon['lat'],lon: latLon['lon']);
              await instance.getDetails();
              Navigator.pushReplacementNamed(context, '/home',arguments: {'cityName':result,'main':instance.main,'desc':instance.description,'temp':instance.temp,'feelsLike':instance.feelsLike,'tempMax':instance.tempMax,'tempMin':instance.tempMin,'pressure':instance.pressure,'humidity':instance.humidity,'windSpeed':instance.windSpeed,'windDeg':instance.windDeg,'windGust':instance.windGust});
            }
        );
      },
    );
  }
}
