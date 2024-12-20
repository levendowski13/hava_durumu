import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hava_durumu/Models/Sehirler.dart';

class Convertjson {
  static Future<List<Sehirler>> donder(BuildContext context) async {
    try {
      String metin = await DefaultAssetBundle.of(context)
          .loadString("assets/data/il_ilce.json");

      var jsonObject = jsonDecode(metin);

      List<Sehirler> veri = (jsonObject as List)
          .map(
            (e) => Sehirler.fromMap(e),
          )
          .toList();

      return veri;
    } catch (e) {
      print("JSON OKUMADA HATA VAR");
      return Future.error(e);
    }
  }
}
