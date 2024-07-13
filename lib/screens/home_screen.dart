// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:weather_app/widgets/home/header_widget.dart';
import 'package:weather_app/core/fetch_data.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  
  late Future<WeatherData> fetchWeather_;
  final TextEditingController _textController = TextEditingController();


  @override
  void initState() {
    super.initState();
    fetchWeather_ = fetchWeather("Batangas");
  }

  void fetchNewData() {
    setState(() {
      fetchWeather_ = fetchWeather(_textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                  SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search Region',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton.icon(
                        onPressed: fetchNewData,
                        icon: const Icon(Icons.search),  // Replace with your desired icon
                        label: const Text('Search'), // Text displayed next to the icon
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(55, 58, 64, 1)),
                          padding: WidgetStatePropertyAll(EdgeInsets.all(15.0)),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          ),
                    ),
                )

              ],
            ),
          ),

          FutureBuilder<WeatherData>(
            future: fetchWeather_,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HeaderWidget(
                  iconSrc: snapshot.data?.current.condition.icon ?? "//static.vecteezy.com/system/resources/thumbnails/012/042/301/small_2x/warning-sign-icon-transparent-background-free-png.png", 
                  region: snapshot.data?.location.region ?? "No Data", 
                  country: snapshot.data?.location.country ?? "No Data", 
                  tempC: snapshot.data?.current.tempC.toString() ?? "No Data",
                  conditionLabel: snapshot.data?.current.condition.text ?? "No Data",
                  heatIndex: snapshot.data?.current.heatindexC.toString() ?? "No Data",
                  humidity: snapshot.data?.current.humidity.toString() ?? "No Data",
                  windSpeed: snapshot.data?.current.windKph.toString() ?? "No Data",
                  );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          )

        ],
      );
  }
}
