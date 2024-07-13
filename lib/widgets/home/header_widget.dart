import 'package:flutter/material.dart';
import 'package:weather_app/widgets/home/otherInfo_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  final String iconSrc;
  final String region;
  final String country;
  final String conditionLabel;
  final String tempC;
  final String humidity;
  final String heatIndex;
  final String windSpeed;

  const HeaderWidget({
    super.key, 
    required this.conditionLabel,
    required this.iconSrc,
    required this.region,
    required this.country,
    required this.tempC,
    required this.windSpeed,
    required this.heatIndex,
    required this.humidity
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(region, style: GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.bold)),
        ),

        Text(
          country, 
          style: GoogleFonts.poppins(fontSize: 15.0),
        ),

        Image.network(
          'https:$iconSrc',
          width: 80.0, 
          height: 80.0,
        ),

        Text(
          "$tempC °C", 
          style: const TextStyle(
            fontSize: 30.0, 
            fontWeight: FontWeight.bold
          ),
        ),

        Text(
          conditionLabel, 
          style: GoogleFonts.poppins(
            fontSize: 15.0
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: OtherInfoWidget(heat_index: heatIndex, humidity: humidity, wind_speed: windSpeed),
        )
        
      ],
    );
  }
}