import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/weather_repository.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherRepository weatherRepository = locator<WeatherRepository>();

  WeatherBloc() : super(WeatherInitialState()) {

    on<WeatherEvent>((event, emit) async {
      if (event is FetchWeatherEvent) {
        emit(WeatherLoadingState());

        try{
          Weather currentWeather = await weatherRepository.getWeather(event.city);
          emit(WeatherLoadedState(weather: currentWeather));
        } catch (_) {
          emit(WeatherErrorState());
        }
      }
    });
  }
}
