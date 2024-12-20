// To parse this JSON data, do
//
//     final hava = havaFromMap(jsonString);

import 'dart:convert';

Hava havaFromMap(String str) => Hava.fromMap(json.decode(str));

String havaToMap(Hava data) => json.encode(data.toMap());

class Hava {
  String? date;
  String? day;
  String? icon;
  String? description;
  String? status;
  String? degree;
  String? min;
  String? max;
  String? night;
  String? humidity;

  Hava({
    this.date,
    this.day,
    this.icon,
    this.description,
    this.status,
    this.degree,
    this.min,
    this.max,
    this.night,
    this.humidity,
  });

  factory Hava.fromMap(Map<String, dynamic> json) => Hava(
        date: json["date"],
        day: json["day"],
        icon: json["icon"],
        description: json["description"],
        status: json["status"],
        degree: json["degree"],
        min: json["min"],
        max: json["max"],
        night: json["night"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toMap() => {
        "date": date,
        "day": day,
        "icon": icon,
        "description": description,
        "status": status,
        "degree": degree,
        "min": min,
        "max": max,
        "night": night,
        "humidity": humidity,
      };
}
