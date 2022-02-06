import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc.dart';
import 'package:weather_app/pages/select_city_page.dart';
import 'package:weather_app/widgets/city_name.dart';
import 'package:weather_app/widgets/last_update_time.dart';
import 'package:weather_app/widgets/min_max_temperature.dart';
import 'package:weather_app/widgets/weather_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hava Durumu Uygulaması'),
        actions: [
          IconButton(onPressed: () async {
            String location = await Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCityPage(),));
            debugPrint('location : $location');

            _weatherBloc.add(FetchWeatherEvent(city: location));

            }, icon: Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        bloc: _weatherBloc,
        builder: (context, state) {

          if(state is WeatherInitialState){
            return Center(child: Text('Lütfen bir şehir seçiniz'));
          }else if(state is WeatherLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else if (state is WeatherLoadedState){
            debugPrint('weather : ' + state.weather.toString());
            return ListView(
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
            );
          }else { //if(state is WeatherErrorState)
            return Center(child: Text('Bir hata meydana geldi !'),);
          }
        },
      ),
    );
  }
}
