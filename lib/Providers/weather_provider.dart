
import 'package:flutter/cupertino.dart';
import 'package:weather_app/Models/weather_Model.dart';

class weatherProvider extends ChangeNotifier
{
  WeatherModel? _weatherData;

  String? cityName;

  set weatherData(WeatherModel? weather)
  {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;




}