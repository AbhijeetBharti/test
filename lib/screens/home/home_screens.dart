import 'package:flutter/material.dart';
import 'package:weather_test/screens/forecast_weather/forecast_weather_screen.dart';
import 'package:weather_test/screens/real_time_weather/real_time_weather_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 2,
      ),
      body: [
        const RealTimeWeather(),
        const ForecastWeather(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_system_daydream),
            label: 'Real Time Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_system_daydream),
            label: 'Forecast Weather',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
