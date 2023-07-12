import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weather_Model.dart';

class WeatherService
{
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '4dc896ec0ff546f3885140432230607';



  Future<WeatherModel> getWeather({required String cityName}) async
  {
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName');

   http.Response response = await http.get(url);

   Map< String , dynamic > data   =  jsonDecode(response.body);

   print(data);



    // Map<String, dynamic> data = jsonData['consoidated_weather'][0];



    WeatherModel weather = WeatherModel.fromJson(data);


    return weather;
    




  }




}






// void main() async
// {
//
//   print(await createOrderMessage());
//   print("Hello");
//
// }
//
//
//
// Future<String> createOrderMessage() async
// {
//   var order = await fetchUserOrder();
//
//   return 'Your order is: $order';
//
// }
//
//
//
//  Future<String> fetchUserOrder()  =>
//
//  Future.delayed(
// const Duration(seconds: 2),
//        () => 'Large Latte',
//
// ); // Future.delayed