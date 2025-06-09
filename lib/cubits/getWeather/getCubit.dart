import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/colors.dart';
import 'package:weather/cubits/getWeather/getState.dart';
import 'package:weather/models/weather2.dart';
import 'package:weather/services/dio.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitWeather());
  WeatherM? weather;
  void getWeather({String location = "Yemen"}) async {
    emit(LoadingWeather());

    try {
      weather = await WeatherDio().getHTTP(location: location);
      //For colors change
      setWeatherColors(weather!.current.condition.text.trim());

      emit(SuccessWeather());
    } catch (e) {
      emit(FailuerWeather(error: e.toString()));
    }
  }
}
