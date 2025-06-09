import 'package:flutter/material.dart';
import 'package:weather/colors.dart';
import 'package:weather/page/search.dart';

class ErrorWeather extends StatelessWidget {
  const ErrorWeather({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SearchWeather(),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ERROR!",
                      style: TextStyle(color: kTextColor),
                    ),
                    Text(
                      " Try Again",
                      style: TextStyle(color: kTextColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
