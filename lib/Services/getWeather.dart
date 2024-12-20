import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hava_durumu/Models/Hava.dart';

class Getweather {
  Getweather._();

  static final Getweather _weather = Getweather._();    // singleton

  static getWeather() {
    return _weather;
  }

  Future<List<Hava>> getHava(String sehir) async {
    List<Hava> hava = [];

    try {
      Map<String, dynamic> header = {
        "authorization": "apikey 4QNIoaEWvQ9CEhD6tqQ9o6:0DojnD4P8poRaK2DHaQIwt",
        "content-type": "application/json"
      };

      var response = await Dio().get(
        "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$sehir",
        options: Options(headers: header),
      );

      if (response.statusCode == 200) {
        hava = (response.data["result"] as List)
            .map(
              (e) => Hava.fromMap(e),
            )
            .toList();
      }

      return hava;
    } catch (e) {
      return Future.error(e);
    }
  }
}
