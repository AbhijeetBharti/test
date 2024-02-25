import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc/forecast_weather_bloc.dart';

class ForecastWeather extends StatefulWidget {
  const ForecastWeather({super.key});

  @override
  State<ForecastWeather> createState() => _ForecastWeatherState();
}

class _ForecastWeatherState extends State<ForecastWeather> {
  final TextEditingController cityController = TextEditingController();

  late BuildContext blocContext;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ForecastWeatherBloc()..add(FetchWeather(location: 'Bengaluru')),
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
                    .read<ForecastWeatherBloc>()
                    .add(FetchWeather(location: value));
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<ForecastWeatherBloc, ForecastWeatherState>(
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
                return DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(text: "Minutely"),
                          Tab(text: "Hourly"),
                          Tab(text: "Daily"),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: TabBarView(
                          children: <Widget>[
                            ListView.builder(
                                itemCount:
                                    state.data.timelines!.minutely!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(DateFormat('dd-MMM-yyyy hh:mm a')
                                          .format(state.data.timelines!
                                              .minutely![index].time!)),
                                      Text(state.data.timelines!
                                          .minutely![index].values
                                          .toString()),
                                    ],
                                  );
                                }),
                            ListView.builder(
                                itemCount: state.data.timelines!.hourly!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(DateFormat('dd-MMM-yyyy hh:mm a')
                                          .format(state.data.timelines!
                                              .hourly![index].time!)),
                                      Text(state
                                          .data.timelines!.hourly![index].values
                                          .toString()),
                                    ],
                                  );
                                }),
                            ListView.builder(
                                itemCount: state.data.timelines!.daily!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(DateFormat('dd-MMM-yyyy').format(
                                          state.data.timelines!.daily![index]
                                              .time!)),
                                      Text(
                                          "Temp Max : ${state.data.timelines!.daily![index].values!.temperatureApparentMax}"),
                                      Text(
                                          "Temp Min : ${state.data.timelines!.daily![index].values!.temperatureApparentMin}")
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: Text("Fetching weather..."));
            },
          ),
        ],
      ),
    );
  }
}
