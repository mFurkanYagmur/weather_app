import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/model/weather.dart';

class WeatherApiClient {
  static const String baseUrl = 'https://www.metaweather.com/';

  Future<int> getLocationId(String location) async {
    String locationUrl = baseUrl + '/api/location/search/?query=' + location;
    Client client = Client();

    final responseClient = await client.get(Uri.parse(locationUrl));
    if (responseClient.statusCode != 200) {
      throw 'Veri Getirilemedi';
    }
    final responseJson = (jsonDecode(responseClient.body)) as List;
    return responseJson[0]['woeid'];
  }

  Future<Weather> getWeather(int locationId) async {
    String weatherUrl = baseUrl + '/api/location/' + locationId.toString();
    Client client = Client();

    final clientResponse = await client.get(Uri.parse(weatherUrl));
    if(clientResponse.statusCode != 200){
      throw 'Hava durumu getirilemedi!';
    }
    final jsonResponse = jsonDecode(clientResponse.body);
    return Weather.fromJson(jsonResponse);
  }
}
