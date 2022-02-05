import 'package:flutter/material.dart';
import 'package:weather_app/pages/select_city_page.dart';
import 'package:weather_app/widgets/city_name.dart';
import 'package:weather_app/widgets/last_update_time.dart';
import 'package:weather_app/widgets/min_max_temperature.dart';
import 'package:weather_app/widgets/weather_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hava Durumu Uygulaması'),
        actions: [
          IconButton(onPressed: () async {
            String location = await Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCityPage(),));
            debugPrint('location : $location');
            }, icon: Icon(Icons.search)),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CityNameWidget(location: 'Ankara'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: LastUpdateTime(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: WeatherImage(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: MinMaxTemperature(),
            ),
          ),
        ],
      ),
    );
  }
}
