class WeatherState {}

class InitWeather extends WeatherState {}

class LoadingWeather extends WeatherState {}

class SuccessWeather extends WeatherState {}

class FailuerWeather extends WeatherState {
  FailuerWeather({required String error});
}
