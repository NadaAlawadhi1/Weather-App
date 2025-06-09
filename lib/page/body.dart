import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/colors.dart';
import 'package:weather/components/card.dart';
import 'package:weather/cubits/getWeather/getCubit.dart';
import 'package:weather/models/weather2.dart';
import 'package:weather/page/search.dart';

class BodyWeather extends StatefulWidget {
  const BodyWeather({super.key});

  @override
  State<BodyWeather> createState() => _BodyWeatherState();
}

class _BodyWeatherState extends State<BodyWeather> {
  @override
  Widget build(BuildContext context) {
    WeatherM weather = BlocProvider.of<WeatherCubit>(context).weather!;
    String dateString = weather.forecast.forecastday[0].date.toString();
    DateTime date = DateTime.parse(dateString);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackColor,
        title: Text(
          "Weather",
          style: TextStyle(color: kTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SearchWeather(),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.location_on,
                  color: kTextColor,
                  size: 55,
                ),
                SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.4, // Limits width to 40% of screen
                      child: Text(
                        weather.location.name,
                        style: TextStyle(fontSize: 22, color: kTextColor),
                        overflow: TextOverflow.ellipsis, // Truncate long text
                        maxLines: 1, // Restrict to a single line
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.4, // Limits width to 40% of screen
                      child: Text(
                        weather.location.country,
                        style: TextStyle(fontSize: 15, color: kTextColor),
                        overflow: TextOverflow.ellipsis, // Truncate long text
                        maxLines: 1, // Restrict to a single line
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  DateFormat('dd MMM yyyy').format(date),
                  style: TextStyle(fontSize: 12, color: kTextColor),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.6, // Limits width to 60% of screen
                      child: Text(
                        weather.current.condition.text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis, // Truncate long text
                        maxLines: 2, // Restrict to a single line
                      ),
                    ),
                    Text(
                      weather.current.tempC.toString(),
                      style: TextStyle(
                          fontSize: 30,
                          color: kTextColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Image.network(
                  weather.current.condition.icon,
                  width: 50,
                  height: 50,
                  color: kTextColor,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                CardWeather(
                  index: 0,
                ),
                CardWeather(
                  index: 1,
                ),
                CardWeather(
                  index: 2,
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
