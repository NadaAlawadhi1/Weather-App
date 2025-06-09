import 'package:flutter/material.dart';
import 'package:weather/colors.dart';

class LoadWeather extends StatelessWidget {
  const LoadWeather({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Expanded(
        child: Center(
          child: CircularProgressIndicator(
            color: kTextColor,
            backgroundColor: kTextColor.withOpacity(0.1),
          ),
        ),
      ),
    );
  }
}
