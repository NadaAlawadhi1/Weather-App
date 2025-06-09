import 'package:dio/dio.dart';
import 'package:weather/models/weather2.dart';

class WeatherDio {
  Future<WeatherM> getHTTP({required String location}) async {
    final dio = Dio();
    final response = await dio
        .get('https://api.weatherapi.com/v1/forecast.json', queryParameters: {
      "key": "be2d29b901bf4f589ac204138252003",
      "q": location,
      "days": 3,
      "aqi": "no",
      "alerts": "no",
    });
    WeatherM weather = WeatherM.fromJson(response.data);
    return weather;
  }
}
