// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:weather_app/widgets/home/SizeBox.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherInfoWidget extends StatelessWidget {
  final String heat_index;
  final String humidity;
  final String wind_speed;
  
  const OtherInfoWidget({
    super.key,
    required this.heat_index,
    required this.humidity,
    required this.wind_speed
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Other Information", style: GoogleFonts.poppins(fontSize: 15.0, fontWeight: FontWeight.bold),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizeBox(
              value: "$heat_index °C",
              label: "Heat Index",
              icon: Icons.sunny,
            ),

            SizeBox(
              value: "$humidity %",
              label: "Humidity",
              icon: Icons.water_drop
            ),

            SizeBox(
              value: "$wind_speed kph",
              label: "Wind Speed",
              icon: Icons.wind_power,
            ),

        ],)
      ],
      );
  }
}