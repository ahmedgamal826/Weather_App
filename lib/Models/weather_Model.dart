import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {
        required this.date,
        required this.temp,
        required this.maxTemp,
        required this.minTemp,
        required this.weatherStateName
      }
      );


 factory WeatherModel.fromJson(dynamic data)
  {
    var jsonData = data['forecast']['forecastday'][0]['day'];


    return WeatherModel(

        date: data['current']['last_updated'],
        temp: data['current']['temp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'tem = $temp   date = $date  maxTemp = $maxTemp  minTemp = $minTemp';
  }


  String getImage()
  {
    if(weatherStateName == 'Clear'
        || weatherStateName == 'Sunny'
        || weatherStateName == 'Light Cloud' )
    {
      return 'assets/images/clear.png';
    }

    else if (weatherStateName == 'Sleet')
      {
        return 'assets/images/snow.png';
      }

    else if (weatherStateName == 'Snow')
    {
      return 'assets/images/snow.png';
    }

    else if (weatherStateName == 'Hail')
    {
      return 'assets/images/snow.png';
    }

    else if (weatherStateName == 'Heavy Cloud')
    {
      return 'assets/images/cloudy.png';
    }

    else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' || weatherStateName == 'Patchy rain possible')
    {
      return 'assets/images/rainy.png';
    }

    else if (weatherStateName == 'Thunderstorm')
    {
      return 'assets/images/thunderstorm.png';
    }

    else
      {
        return 'assets/images/clear.png';

      }
  }




  MaterialColor getThemeColor()
  {
    if(weatherStateName == 'Clear'
        || weatherStateName == 'Sunny'
        || weatherStateName == 'Light Cloud' )
    {
      return Colors.orange;
    }

    else if (weatherStateName == 'Sleet')
    {
      return Colors.blue;
    }

    else if (weatherStateName == 'Snow')
    {
      return Colors.blue;
    }

    else if (weatherStateName == 'Hail')
    {
      return Colors.blue;
    }

    else if (weatherStateName == 'Heavy Cloud')
    {
      return Colors.blueGrey;
    }

    else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' || weatherStateName == 'Patchy rain possible')
    {
      return Colors.blue;
    }

    else if (weatherStateName == 'Thunderstorm')
    {
      return Colors.yellow;
    }

    else
    {
      return Colors.orange;

    }




  }



}
