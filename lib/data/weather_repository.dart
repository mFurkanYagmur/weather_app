import 'package:weather_app/data/weather_api_client.dart';
import 'package:weather_app/model/weather.dart';

import '../locator.dart';

class WeatherRepository {
  final _weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String location) async {
    final locationId = await _weatherApiClient.getLocationId(location);
    return await _weatherApiClient.getWeather(locationId);
  }
}
