import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/getWeather/getCubit.dart';
import 'package:weather/page/home.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => WeatherCubit(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: HomePage(),
    ));
  }
}
