import 'dart:convert';

RealTimeWeatherModel realTimeWeatherModelFromJson(String str) =>
    RealTimeWeatherModel.fromJson(json.decode(str));

class RealTimeWeatherModel {
  Data? data;
  Location? location;

  RealTimeWeatherModel({
    this.data,
    this.location,
  });

  factory RealTimeWeatherModel.fromJson(Map<String, dynamic> json) =>
      RealTimeWeatherModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
      );
}

class Data {
  DateTime? time;
  Map<String, double?>? values;

  Data({
    this.time,
    this.values,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        values: Map.from(json["values"]!)
            .map((k, v) => MapEntry<String, double?>(k, v?.toDouble())),
      );
}

class Location {
  double? lat;
  double? lon;
  String? name;
  String? type;

  Location({
    this.lat,
    this.lon,
    this.name,
    this.type,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        name: json["name"],
        type: json["type"],
      );
}
