import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/colors.dart';
import 'package:weather/cubits/getWeather/getCubit.dart';
import 'package:weather/cubits/getWeather/getState.dart';
import 'package:weather/page/body.dart';
import 'package:weather/page/error.dart';
import 'package:weather/page/load.dart';
import 'package:weather/page/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherCubit>(context).getWeather(location: "Yemen");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is LoadingWeather) {
          return LoadWeather();
        } else if (state is SuccessWeather) {
          return BodyWeather();
        } else {
          return ErrorWeather();
        }
      },
    );
  }
}
