import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/colors.dart';
import 'package:weather/cubits/getWeather/getCubit.dart';
import 'package:weather/models/weather2.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CardWeather extends StatefulWidget {
  int index;
  CardWeather({required this.index, super.key});

  @override
  State<CardWeather> createState() => _CardWeatherState();
}

class _CardWeatherState extends State<CardWeather> {
  @override
  Widget build(BuildContext context) {
    WeatherM weather = BlocProvider.of<WeatherCubit>(context).weather!;
    String dateString =
        weather.forecast.forecastday[widget.index].date.toString();
    DateTime date = DateTime.parse(dateString);
    String dayOfWeek = DateFormat('EEEE').format(date); // Full day name

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kTextColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Prevent excessive stretching
            children: [
              Text(
                dayOfWeek,
                style: TextStyle(fontSize: 10, color: kTextColor),
              ),
              SizedBox(height: 5),
              Text(
                DateFormat('dd MMM').format(date),
                style: TextStyle(fontSize: 10, color: kTextColor),
              ),
              SizedBox(height: 5),
              Image.network(
                weather.forecast.forecastday[widget.index].day.condition.icon,
                width: 50,
                height: 50,
                color: kTextColor,
              ),
              SizedBox(height: 5),
              SizedBox(
                width: 60, // Set a fixed width to avoid expanding
                height: 30, // Set a fixed height to align all cards
                child: Text(
                  weather.forecast.forecastday[widget.index].day.condition.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: kTextColor),
                  overflow: TextOverflow.ellipsis, // Cut off long text
                  maxLines: 2, // Allow at most two lines
                ),
              ),
              SizedBox(height: 5),
              Text(
                weather.forecast.forecastday[widget.index].day.avgtempC
                    .toString(),
                style: TextStyle(fontSize: 10, color: kTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
