class Location {
  final String region;
  final String country;

  Location({
    required this.region,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        region: json['region'] as String,
        country: json['country'] as String,
      );
}

class Condition {
  final String text;
  final String icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'] as String,
        icon: json['icon'] as String,
      );
}

class Current {
  final double tempC;
  final Condition condition;
  final double windKph;
  final int humidity;
  final double heatindexC;

  Current({
    required this.tempC,
    required this.condition,
    required this.windKph,
    required this.humidity,
    required this.heatindexC,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: json['temp_c'] as double,
        condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
        windKph: json['wind_kph'] as double,
        humidity: json['humidity'] as int,
        heatindexC: json['heatindex_c'] as double,
      );
}

class WeatherData {
  final Location location;
  final Current current;

  WeatherData({
    required this.location,
    required this.current,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return switch (json){
      {
        'location': Map<String, dynamic> _,
        'current': Map<String, dynamic> _,
      } => 
        WeatherData(
          location: Location.fromJson(json['location'] as Map<String, dynamic>),
          current: Current.fromJson(json['current'] as Map<String, dynamic>),
        ),
      _ =>
        throw const  FormatException('Failed to load weather data.')

    };
  }
}