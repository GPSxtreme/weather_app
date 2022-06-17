// ignore_for_file: prefer_const_constructors, camel_case_types, use_build_context_synchronously, unused_local_variable, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:drop_shadow/drop_shadow.dart';

class notAvailable extends StatefulWidget {
  const notAvailable({Key? key}) : super(key: key);

  @override
  State<notAvailable> createState() => _notAvailableState();
}

class _notAvailableState extends State<notAvailable> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data: ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      backgroundColor: HexColor('393E46'),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropShadow(blurRadius: 2,spread: 0.5,child: Icon(Ionicons.sad_outline,size: 200,color: HexColor('1B2430'),),),
              SizedBox(height: 40,),
              Text('Weather details could not be fetched \nCity name: ${data['cityName']}',style: GoogleFonts.sarabun(
                textStyle: TextStyle(color: HexColor('EEEEEE'),fontSize: 20,fontWeight: FontWeight.w500,letterSpacing: 1),
              ),),
              SizedBox(height: 40,),
              IconButton(onPressed: (){
                Navigator.pushReplacementNamed(context,'/location');
              }, icon: Icon(Icons.arrow_back_rounded,color: HexColor('EEEEEE'),size: 40,))
            ],
          ),
        ),
      ),
    );
  }
}
