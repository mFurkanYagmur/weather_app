import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/pages/home_page.dart';

import 'blocs/weather_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
          child: HomePage()),
    );
  }
}
