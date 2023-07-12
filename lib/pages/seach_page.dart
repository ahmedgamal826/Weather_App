


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_Model.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {

  String ? cityName;

  SearchPage({super.key, this.updateUi});

  VoidCallback ? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xffFFAD3B),
        title: Text(
          "Search a City",
          
        ),

      ),


      body: Center(
        child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data)
            {
              cityName = data;


            },

            onSubmitted: (String data) async
            {
              cityName = data;

              WeatherService services = WeatherService();
             WeatherModel weather =  await services.getWeather(cityName: cityName!);


              Provider.of<weatherProvider>(context, listen: false).weatherData = weather;
              Provider.of<weatherProvider>(context,listen: false).cityName = cityName;
             //updateUi!();
             Navigator.pop(context);






            // print(weather);


            },
            decoration: InputDecoration(
              hintText: "Enter City Name",
              label: Text("search"),
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () async
                  {
                    WeatherService services = WeatherService();
                    WeatherModel weather =  await services.getWeather(cityName: cityName!);


                    Provider.of<weatherProvider>(context, listen: false).weatherData = weather;
                    Provider.of<weatherProvider>(context,listen: false).cityName = cityName;
                    //updateUi!();
                    Navigator.pop(context);
                  },

                  child: GestureDetector(
                      onTap: () async
                      {
                        WeatherService services = WeatherService();
                        WeatherModel weather =  await services.getWeather(cityName: cityName!);


                        Provider.of<weatherProvider>(context, listen: false).weatherData = weather;
                        Provider.of<weatherProvider>(context,listen: false).cityName = cityName;
                        //updateUi!();
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.search))),
              contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 25)
            ),

          ),
        ),
      ),

    );
  }
}



