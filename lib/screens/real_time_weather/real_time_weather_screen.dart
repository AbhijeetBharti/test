import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_test/screens/real_time_weather/bloc/real_time_weather_bloc.dart';

class RealTimeWeather extends StatefulWidget {
  const RealTimeWeather({super.key});

  @override
  State<RealTimeWeather> createState() => _RealTimeWeatherState();
}

class _RealTimeWeatherState extends State<RealTimeWeather> {
  final TextEditingController cityController = TextEditingController();

  late BuildContext blocContext;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          RealTimeWeatherBloc()..add(FetchWeather(location: 'Bengaluru')),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: cityController,
            decoration: const InputDecoration(hintText: 'Enter your city'),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                blocContext
                    .read<RealTimeWeatherBloc>()
                    .add(FetchWeather(location: value));
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<RealTimeWeatherBloc, RealTimeWeatherState>(
            builder: (context, state) {
              blocContext = context;
              if (state is Failed) {
                return Center(
                  child: Text(
                    state.errorMessage,
                  ),
                );
              }
              if (state is WeatherFetched) {
                return Text(state.data.data!.values.toString());
              }
              return const Center(child: Text("Fetching weather..."));
            },
          ),
        ],
      ),
    );
  }
}
