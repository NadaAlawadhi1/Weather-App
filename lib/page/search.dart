import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/colors.dart';
import 'package:weather/cubits/getWeather/getCubit.dart';

class SearchWeather extends StatefulWidget {
  const SearchWeather({super.key});

  @override
  State<SearchWeather> createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<SearchWeather> {
  @override
  Widget build(BuildContext context) {
    TextEditingController serchController = TextEditingController();

    return Row(
      children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.all(12),
          height: 80,
          decoration: BoxDecoration(
              color: kTextColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: serchController,
            onSubmitted: (value) {
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(location: value);
            },
            cursorColor: kBackColor,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search here... ",
                suffixIcon: Icon(Icons.search)),
          ),
        ))
      ],
    );
  }
}
