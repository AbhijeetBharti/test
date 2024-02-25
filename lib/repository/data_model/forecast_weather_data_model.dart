import 'dart:convert';

ForecastWeatherModel forecastWeatherModelFromJson(String str) =>
    ForecastWeatherModel.fromJson(json.decode(str));

class ForecastWeatherModel {
  Timelines? timelines;
  Location? location;

  ForecastWeatherModel({
    this.timelines,
    this.location,
  });

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) =>
      ForecastWeatherModel(
        timelines: json["timelines"] == null
            ? null
            : Timelines.fromJson(json["timelines"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
      );
}

class Location {
  num? lat;
  num? lon;
  String? name;
  String? type;

  Location({
    this.lat,
    this.lon,
    this.name,
    this.type,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"],
        lon: json["lon"],
        name: json["name"],
        type: json["type"],
      );
}

class Timelines {
  List<Hourly>? minutely;
  List<Hourly>? hourly;
  List<Daily>? daily;

  Timelines({
    this.minutely,
    this.hourly,
    this.daily,
  });

  factory Timelines.fromJson(Map<String, dynamic> json) => Timelines(
        minutely: json["minutely"] == null
            ? []
            : List<Hourly>.from(
                json["minutely"]!.map((x) => Hourly.fromJson(x))),
        hourly: json["hourly"] == null
            ? []
            : List<Hourly>.from(json["hourly"]!.map((x) => Hourly.fromJson(x))),
        daily: json["daily"] == null
            ? []
            : List<Daily>.from(json["daily"]!.map((x) => Daily.fromJson(x))),
      );
}

class Daily {
  DateTime? time;
  Values? values;

  Daily({
    this.time,
    this.values,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        values: json["values"] == null ? null : Values.fromJson(json["values"]),
      );
}

class Values {
  num? cloudBaseAvg;
  num? cloudBaseMax;
  num? cloudBaseMin;
  num? cloudCeilingAvg;
  num? cloudCeilingMax;
  num? cloudCeilingMin;
  num? cloudCoverAvg;
  num? cloudCoverMax;
  num? cloudCoverMin;
  num? dewPonumAvg;
  num? dewPonumMax;
  num? dewPonumMin;
  num? evapotranspirationAvg;
  num? evapotranspirationMax;
  num? evapotranspirationMin;
  num? evapotranspirationSum;
  num? freezingRainnumensityAvg;
  num? freezingRainnumensityMax;
  num? freezingRainnumensityMin;
  num? humidityAvg;
  num? humidityMax;
  num? humidityMin;
  num? iceAccumulationAvg;
  num? iceAccumulationLweAvg;
  num? iceAccumulationLweMax;
  num? iceAccumulationLweMin;
  num? iceAccumulationLweSum;
  num? iceAccumulationMax;
  num? iceAccumulationMin;
  num? iceAccumulationSum;
  DateTime? moonriseTime;
  DateTime? moonsetTime;
  num? precipitationProbabilityAvg;
  num? precipitationProbabilityMax;
  num? precipitationProbabilityMin;
  num? pressureSurfaceLevelAvg;
  num? pressureSurfaceLevelMax;
  num? pressureSurfaceLevelMin;
  num? rainAccumulationAvg;
  num? rainAccumulationLweAvg;
  num? rainAccumulationLweMax;
  num? rainAccumulationLweMin;
  num? rainAccumulationMax;
  num? rainAccumulationMin;
  num? rainAccumulationSum;
  num? rainnumensityAvg;
  num? rainnumensityMax;
  num? rainnumensityMin;
  num? sleetAccumulationAvg;
  num? sleetAccumulationLweAvg;
  num? sleetAccumulationLweMax;
  num? sleetAccumulationLweMin;
  num? sleetAccumulationLweSum;
  num? sleetAccumulationMax;
  num? sleetAccumulationMin;
  num? sleetnumensityAvg;
  num? sleetnumensityMax;
  num? sleetnumensityMin;
  num? snowAccumulationAvg;
  num? snowAccumulationLweAvg;
  num? snowAccumulationLweMax;
  num? snowAccumulationLweMin;
  num? snowAccumulationLweSum;
  num? snowAccumulationMax;
  num? snowAccumulationMin;
  num? snowAccumulationSum;
  num? snowDepthAvg;
  num? snowDepthMax;
  num? snowDepthMin;
  num? snowDepthSum;
  num? snownumensityAvg;
  num? snownumensityMax;
  num? snownumensityMin;
  DateTime? sunriseTime;
  DateTime? sunsetTime;
  num? temperatureApparentAvg;
  num? temperatureApparentMax;
  num? temperatureApparentMin;
  num? temperatureAvg;
  num? temperatureMax;
  num? temperatureMin;
  num? uvHealthConcernAvg;
  num? uvHealthConcernMax;
  num? uvHealthConcernMin;
  num? uvIndexAvg;
  num? uvIndexMax;
  num? uvIndexMin;
  num? visibilityAvg;
  num? visibilityMax;
  num? visibilityMin;
  num? weatherCodeMax;
  num? weatherCodeMin;
  num? windDirectionAvg;
  num? windGustAvg;
  num? windGustMax;
  num? windGustMin;
  num? windSpeedAvg;
  num? windSpeedMax;
  num? windSpeedMin;

  Values({
    this.cloudBaseAvg,
    this.cloudBaseMax,
    this.cloudBaseMin,
    this.cloudCeilingAvg,
    this.cloudCeilingMax,
    this.cloudCeilingMin,
    this.cloudCoverAvg,
    this.cloudCoverMax,
    this.cloudCoverMin,
    this.dewPonumAvg,
    this.dewPonumMax,
    this.dewPonumMin,
    this.evapotranspirationAvg,
    this.evapotranspirationMax,
    this.evapotranspirationMin,
    this.evapotranspirationSum,
    this.freezingRainnumensityAvg,
    this.freezingRainnumensityMax,
    this.freezingRainnumensityMin,
    this.humidityAvg,
    this.humidityMax,
    this.humidityMin,
    this.iceAccumulationAvg,
    this.iceAccumulationLweAvg,
    this.iceAccumulationLweMax,
    this.iceAccumulationLweMin,
    this.iceAccumulationLweSum,
    this.iceAccumulationMax,
    this.iceAccumulationMin,
    this.iceAccumulationSum,
    this.moonriseTime,
    this.moonsetTime,
    this.precipitationProbabilityAvg,
    this.precipitationProbabilityMax,
    this.precipitationProbabilityMin,
    this.pressureSurfaceLevelAvg,
    this.pressureSurfaceLevelMax,
    this.pressureSurfaceLevelMin,
    this.rainAccumulationAvg,
    this.rainAccumulationLweAvg,
    this.rainAccumulationLweMax,
    this.rainAccumulationLweMin,
    this.rainAccumulationMax,
    this.rainAccumulationMin,
    this.rainAccumulationSum,
    this.rainnumensityAvg,
    this.rainnumensityMax,
    this.rainnumensityMin,
    this.sleetAccumulationAvg,
    this.sleetAccumulationLweAvg,
    this.sleetAccumulationLweMax,
    this.sleetAccumulationLweMin,
    this.sleetAccumulationLweSum,
    this.sleetAccumulationMax,
    this.sleetAccumulationMin,
    this.sleetnumensityAvg,
    this.sleetnumensityMax,
    this.sleetnumensityMin,
    this.snowAccumulationAvg,
    this.snowAccumulationLweAvg,
    this.snowAccumulationLweMax,
    this.snowAccumulationLweMin,
    this.snowAccumulationLweSum,
    this.snowAccumulationMax,
    this.snowAccumulationMin,
    this.snowAccumulationSum,
    this.snowDepthAvg,
    this.snowDepthMax,
    this.snowDepthMin,
    this.snowDepthSum,
    this.snownumensityAvg,
    this.snownumensityMax,
    this.snownumensityMin,
    this.sunriseTime,
    this.sunsetTime,
    this.temperatureApparentAvg,
    this.temperatureApparentMax,
    this.temperatureApparentMin,
    this.temperatureAvg,
    this.temperatureMax,
    this.temperatureMin,
    this.uvHealthConcernAvg,
    this.uvHealthConcernMax,
    this.uvHealthConcernMin,
    this.uvIndexAvg,
    this.uvIndexMax,
    this.uvIndexMin,
    this.visibilityAvg,
    this.visibilityMax,
    this.visibilityMin,
    this.weatherCodeMax,
    this.weatherCodeMin,
    this.windDirectionAvg,
    this.windGustAvg,
    this.windGustMax,
    this.windGustMin,
    this.windSpeedAvg,
    this.windSpeedMax,
    this.windSpeedMin,
  });

  factory Values.fromJson(Map<String, dynamic> json) => Values(
        cloudBaseAvg: json["cloudBaseAvg"],
        cloudBaseMax: json["cloudBaseMax"],
        cloudBaseMin: json["cloudBaseMin"],
        cloudCeilingAvg: json["cloudCeilingAvg"],
        cloudCeilingMax: json["cloudCeilingMax"],
        cloudCeilingMin: json["cloudCeilingMin"],
        cloudCoverAvg: json["cloudCoverAvg"],
        cloudCoverMax: json["cloudCoverMax"],
        cloudCoverMin: json["cloudCoverMin"],
        dewPonumAvg: json["dewPonumAvg"],
        dewPonumMax: json["dewPonumMax"],
        dewPonumMin: json["dewPonumMin"],
        evapotranspirationAvg: json["evapotranspirationAvg"],
        evapotranspirationMax: json["evapotranspirationMax"],
        evapotranspirationMin: json["evapotranspirationMin"],
        evapotranspirationSum: json["evapotranspirationSum"],
        freezingRainnumensityAvg: json["freezingRainnumensityAvg"],
        freezingRainnumensityMax: json["freezingRainnumensityMax"],
        freezingRainnumensityMin: json["freezingRainnumensityMin"],
        humidityAvg: json["humidityAvg"],
        humidityMax: json["humidityMax"],
        humidityMin: json["humidityMin"],
        iceAccumulationAvg: json["iceAccumulationAvg"],
        iceAccumulationLweAvg: json["iceAccumulationLweAvg"],
        iceAccumulationLweMax: json["iceAccumulationLweMax"],
        iceAccumulationLweMin: json["iceAccumulationLweMin"],
        iceAccumulationLweSum: json["iceAccumulationLweSum"],
        iceAccumulationMax: json["iceAccumulationMax"],
        iceAccumulationMin: json["iceAccumulationMin"],
        iceAccumulationSum: json["iceAccumulationSum"],
        moonriseTime: json["moonriseTime"] == null
            ? null
            : DateTime.parse(json["moonriseTime"]),
        moonsetTime: json["moonsetTime"] == null
            ? null
            : DateTime.parse(json["moonsetTime"]),
        precipitationProbabilityAvg: json["precipitationProbabilityAvg"],
        precipitationProbabilityMax: json["precipitationProbabilityMax"],
        precipitationProbabilityMin: json["precipitationProbabilityMin"],
        pressureSurfaceLevelAvg: json["pressureSurfaceLevelAvg"],
        pressureSurfaceLevelMax: json["pressureSurfaceLevelMax"],
        pressureSurfaceLevelMin: json["pressureSurfaceLevelMin"],
        rainAccumulationAvg: json["rainAccumulationAvg"],
        rainAccumulationLweAvg: json["rainAccumulationLweAvg"],
        rainAccumulationLweMax: json["rainAccumulationLweMax"],
        rainAccumulationLweMin: json["rainAccumulationLweMin"],
        rainAccumulationMax: json["rainAccumulationMax"],
        rainAccumulationMin: json["rainAccumulationMin"],
        rainAccumulationSum: json["rainAccumulationSum"],
        rainnumensityAvg: json["rainnumensityAvg"],
        rainnumensityMax: json["rainnumensityMax"],
        rainnumensityMin: json["rainnumensityMin"],
        sleetAccumulationAvg: json["sleetAccumulationAvg"],
        sleetAccumulationLweAvg: json["sleetAccumulationLweAvg"],
        sleetAccumulationLweMax: json["sleetAccumulationLweMax"],
        sleetAccumulationLweMin: json["sleetAccumulationLweMin"],
        sleetAccumulationLweSum: json["sleetAccumulationLweSum"],
        sleetAccumulationMax: json["sleetAccumulationMax"],
        sleetAccumulationMin: json["sleetAccumulationMin"],
        sleetnumensityAvg: json["sleetnumensityAvg"],
        sleetnumensityMax: json["sleetnumensityMax"],
        sleetnumensityMin: json["sleetnumensityMin"],
        snowAccumulationAvg: json["snowAccumulationAvg"],
        snowAccumulationLweAvg: json["snowAccumulationLweAvg"],
        snowAccumulationLweMax: json["snowAccumulationLweMax"],
        snowAccumulationLweMin: json["snowAccumulationLweMin"],
        snowAccumulationLweSum: json["snowAccumulationLweSum"],
        snowAccumulationMax: json["snowAccumulationMax"],
        snowAccumulationMin: json["snowAccumulationMin"],
        snowAccumulationSum: json["snowAccumulationSum"],
        snowDepthAvg: json["snowDepthAvg"],
        snowDepthMax: json["snowDepthMax"],
        snowDepthMin: json["snowDepthMin"],
        snowDepthSum: json["snowDepthSum"],
        snownumensityAvg: json["snownumensityAvg"],
        snownumensityMax: json["snownumensityMax"],
        snownumensityMin: json["snownumensityMin"],
        sunriseTime: json["sunriseTime"] == null
            ? null
            : DateTime.parse(json["sunriseTime"]),
        sunsetTime: json["sunsetTime"] == null
            ? null
            : DateTime.parse(json["sunsetTime"]),
        temperatureApparentAvg: json["temperatureApparentAvg"],
        temperatureApparentMax: json["temperatureApparentMax"],
        temperatureApparentMin: json["temperatureApparentMin"],
        temperatureAvg: json["temperatureAvg"],
        temperatureMax: json["temperatureMax"],
        temperatureMin: json["temperatureMin"],
        uvHealthConcernAvg: json["uvHealthConcernAvg"],
        uvHealthConcernMax: json["uvHealthConcernMax"],
        uvHealthConcernMin: json["uvHealthConcernMin"],
        uvIndexAvg: json["uvIndexAvg"],
        uvIndexMax: json["uvIndexMax"],
        uvIndexMin: json["uvIndexMin"],
        visibilityAvg: json["visibilityAvg"],
        visibilityMax: json["visibilityMax"],
        visibilityMin: json["visibilityMin"],
        weatherCodeMax: json["weatherCodeMax"],
        weatherCodeMin: json["weatherCodeMin"],
        windDirectionAvg: json["windDirectionAvg"],
        windGustAvg: json["windGustAvg"],
        windGustMax: json["windGustMax"],
        windGustMin: json["windGustMin"],
        windSpeedAvg: json["windSpeedAvg"],
        windSpeedMax: json["windSpeedMax"],
        windSpeedMin: json["windSpeedMin"],
      );
}

class Hourly {
  DateTime? time;
  Map<String, num?>? values;

  Hourly({
    this.time,
    this.values,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        values: Map.from(json["values"]!)
            .map((k, v) => MapEntry<String, num?>(k, v)),
      );
}
