// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dotted_line/dotted_line.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Map data = {};
  String bC = '363333';
  String hC = 'E16428';
  String fC = 'EEEEEE';
  String cC = '272121';
  String mCC ='E16428';
  final Uri url = Uri.parse("https://github.com/GPSxtreme");
  void _launchUrl() async {
    await launchUrl(url);
  }
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data: ModalRoute.of(context)?.settings.arguments as Map;
    Size size = MediaQuery.of(context).size;
    double n = 4.5;
    if(data['windGust'] != 'Not available'){
      n = 2.4;
    }
    return Scaffold(
      backgroundColor: HexColor(bC),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))
                      ),
                      color: HexColor(mCC),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: null,
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            image: AssetImage('assets/main_card.png'),
                            opacity: 0.3,
                            fit: BoxFit.cover
                          ),
                        ),
                        child: SizedBox(
                          height: size.height/4,
                          width: size.width/1.1,
                          child: Center(
                              child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  TextButton.icon(onPressed:(){
                                          Navigator.pushNamed(context,'/location');
                                            },
                                          icon: Icon(Icons.edit,size: 20,color: HexColor(fC),),
                                          label: Text('Edit',style: GoogleFonts.sarabun(
                                            textStyle: TextStyle(fontSize: 20,color: HexColor(fC),fontWeight: FontWeight.w900)
                                          ),),
                                      ),
                                  DottedLine(
                                    direction: Axis.horizontal,
                                    lineLength: 110,
                                    lineThickness: 1,
                                    dashLength: 6.0,
                                    dashRadius: 2.0,
                                    dashGapLength: 6.0,
                                    dashGapColor: Colors.transparent,
                                    dashColor: HexColor(fC),
                                    dashGapRadius: 8.0,
                                  ),
                                      ConstrainedBox(
                                        constraints:BoxConstraints(
                                          minWidth: size.width/5,
                                          maxWidth: size.width/1.5,
                                          minHeight: size.height/18,
                                          maxHeight: size.height/10,
                                        ),
                                        child: AutoSizeText(
                                          data['cityName'],style:GoogleFonts.pacifico(
                                            textStyle:TextStyle(fontSize: 40,color: HexColor('#8a1500'),)
                                        ),
                                          maxFontSize: 60,
                                          minFontSize: 15,
                                          maxLines: 1,
                                        ),
                                      ),
                                  Text(data['desc'].toString().toUpperCase(),style: GoogleFonts.sarabun(
                                      textStyle: TextStyle(fontSize: 20,color: HexColor(fC),fontWeight: FontWeight.w900)
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                ],
                              )
                          ),
                        ),
                      ),
                    ),
              ),//main city and desc
              SizedBox(height: 15,),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: DropShadow(
                              blurRadius: 6,
                              offset: const Offset(2,6),
                              opacity: 1,
                              spread: 1,
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                color: HexColor(cC),
                                child: SizedBox(
                                  height: size.height/5,
                                  width: size.width/2,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FaIcon(Ionicons.thermometer_outline,size: 40,color: HexColor('fcfc03'),),
                                        SizedBox(height: 10,),
                                        Text('CURRENT',style: GoogleFonts.signika(
                                            textStyle:TextStyle(fontSize: 15,color: HexColor('cccccc'),fontWeight: FontWeight.w800)
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(data['temp'].toString()+'°C',style: GoogleFonts.signika(
                                            textStyle:TextStyle(fontSize: 25,color: HexColor(fC))
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),//main temperature
                          Expanded(
                            flex: 1,
                            child: DropShadow(
                              blurRadius: 6,
                              offset: const Offset(2,6),
                              opacity: 1,
                              spread: 1,
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                color: HexColor(cC),
                                child: SizedBox(
                                  height: size.height/5,
                                  width: size.width/2,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FaIcon(FontAwesomeIcons.wind,size: 40,color: HexColor(hC),),
                                        SizedBox(height: 10,),
                                        Text('WIND SPEED',style: GoogleFonts.signika(
                                            textStyle:TextStyle(fontSize: 15,color: HexColor('cccccc'),fontWeight: FontWeight.w800)
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(data['windSpeed'].toString()+' km/h',style: GoogleFonts.signika(
                                            textStyle:TextStyle(fontSize: 25,color: HexColor(fC))
                                         ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),//wind speed
                        ],
                      ),//temperature and wind speed cards
                         Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: DropShadow(
                              blurRadius: 6,
                              offset: const Offset(2,6),
                              opacity: 1,
                              spread: 1,
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                color: HexColor(cC),
                                child: SizedBox(
                                  height: size.height/5,
                                  width: size.width/2,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FaIcon(FontAwesomeIcons.temperatureHigh,size: 40,color: HexColor('#fc0303'),),
                                        SizedBox(height: 10,),
                                        Text('MAXIMUM',style: GoogleFonts.signika(
                                            textStyle:TextStyle(fontSize: 15,color: HexColor('cccccc'),fontWeight: FontWeight.w800)
                                        ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(data['tempMax'].toString()+'°C',style: GoogleFonts.signika(
                                            textStyle:TextStyle(fontSize: 25,color: HexColor(fC))
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),//main temperature
                          Expanded(
                            flex: 1,
                            child: DropShadow(
                              blurRadius: 6,
                              offset: const Offset(2,6),
                              opacity: 1,
                              spread: 1,
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(18))
                                ),
                                color: HexColor(cC),
                                child: SizedBox(
                                  height: size.height/5,
                                  width: size.width/2,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        FaIcon(FontAwesomeIcons.temperatureLow,size: 40,color: HexColor(hC),),
                                        SizedBox(height: 10,),
                                        Text('MINIMUM',style: GoogleFonts.signika(
                                            textStyle:TextStyle(fontSize: 15,color: HexColor('cccccc'),fontWeight: FontWeight.w800)
                                        ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(data['tempMin'].toString()+'°C',style: GoogleFonts.signika(
                                            textStyle:TextStyle(fontSize: 25,color: HexColor(fC))
                                        ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),//temperature maximum and minimum
                      DropShadow(
                        blurRadius: 6,
                        offset: const Offset(2,6),
                        opacity: 1,
                        spread: 1,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(18))
                          ),
                          color: HexColor(cC),
                          child: SizedBox(
                            height: size.height/3,
                            width: size.width,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Pressure',style: GoogleFonts.signika(
                                        textStyle: TextStyle(fontSize: 20,color: HexColor(hC))
                                      ) ,),
                                      SizedBox(width: size.width/2.7,),
                                      Text(data['pressure'].toString()+' pa',style: GoogleFonts.signika(
                                          textStyle: TextStyle(fontSize: 20,color: HexColor(fC))
                                      ) )
                                    ],
                                  ),//pressure
                                  Divider(
                                    thickness: 1.2,
                                    indent: 30,
                                    endIndent: 30,
                                    height: 10,
                                    color: HexColor(bC),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Humidity',style: GoogleFonts.signika(
                                          textStyle: TextStyle(fontSize: 20,color: HexColor(hC))
                                      ) ,),
                                      SizedBox(width: size.width/3,),
                                      Text(data['humidity'].toString()+' g.m-3',style: GoogleFonts.signika(
                                          textStyle: TextStyle(fontSize: 20,color: HexColor(fC))
                                      ) )
                                    ],
                                  ),//humidity
                                  Divider(
                                    thickness: 1.2,
                                    indent: 30,
                                    height: 10,
                                    endIndent: 30,
                                    color: HexColor(bC),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Wind degree',style: GoogleFonts.signika(
                                          textStyle: TextStyle(fontSize: 20,color: HexColor(hC))
                                      ) ,),
                                      SizedBox(width: size.width/2.5,),
                                      Text(data['windDeg'].toString()+'°',style: GoogleFonts.signika(
                                          textStyle: TextStyle(fontSize: 20,color: HexColor(fC))
                                      ) )
                                    ],
                                  ),//wind degree
                                  Divider(
                                    thickness: 1.2,
                                    indent: 30,
                                    height: 10,
                                    endIndent: 30,
                                    color: HexColor(bC),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Wind gust',style: GoogleFonts.signika(
                                          textStyle: TextStyle(fontSize: 20,color: HexColor(hC))
                                      ) ,),
                                      SizedBox(width: size.width/n,),
                                      Text(data['windGust'].toString(),style: GoogleFonts.signika(
                                          textStyle: TextStyle(fontSize: 20,color: HexColor(fC))
                                        )
                                      ),
                                    ],
                                  ),//wind gust
                                  SizedBox(height: 5,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),//other details
                      DropShadow(
                          blurRadius: 6,
                          offset: const Offset(2,6),
                          opacity: 1,
                          spread: 1,
                          child: Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(18))
                            ),
                            color: HexColor(cC),
                            child: SizedBox(
                              width: size.width,
                              height: size.height/9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text('Made by'.toUpperCase(),style: TextStyle(fontWeight: FontWeight.w800,letterSpacing: 2,color: HexColor(fC)),),
                                      TextButton(
                                        onPressed: _launchUrl,
                                        child: Text('GPSxtreme',style: TextStyle(fontWeight: FontWeight.w800,letterSpacing: 1.2,color: HexColor(hC),fontSize: 16)),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 40,),
                                ],
                              ),
                            ),
                          )
                      ),//made by footer
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

