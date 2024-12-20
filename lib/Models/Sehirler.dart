// To parse this JSON data, do
//
//     final sehirler = sehirlerFromMap(jsonString);

import 'dart:convert';

Sehirler sehirlerFromMap(String str) => Sehirler.fromMap(json.decode(str));

String sehirlerToMap(Sehirler data) => json.encode(data.toMap());

class Sehirler {
  String? ilAdi;
  String? plakaKodu;
  List<Ilceler>? ilceler;
  String? kisaBilgi;

  Sehirler({
    this.ilAdi,
    this.plakaKodu,
    this.ilceler,
    this.kisaBilgi,
  });

  factory Sehirler.fromMap(Map<String, dynamic> json) => Sehirler(
        ilAdi: json["il_adi"],
        plakaKodu: json["plaka_kodu"],
        ilceler: json["ilceler"] == null
            ? []
            : List<Ilceler>.from(
                json["ilceler"]!.map((x) => Ilceler.fromMap(x))),
        kisaBilgi: json["kisa_bilgi"],
      );

  Map<String, dynamic> toMap() => {
        "il_adi": ilAdi,
        "plaka_kodu": plakaKodu,
        "ilceler": ilceler == null
            ? []
            : List<dynamic>.from(ilceler!.map((x) => x.toMap())),
        "kisa_bilgi": kisaBilgi,
      };
}

class Ilceler {
  String? ilceAdi;
  String? nufus;
  String? erkekNufus;
  String? kadinNufus;
  String? yuzolcumu;

  Ilceler({
    this.ilceAdi,
    this.nufus,
    this.erkekNufus,
    this.kadinNufus,
    this.yuzolcumu,
  });

  factory Ilceler.fromMap(Map<String, dynamic> json) => Ilceler(
        ilceAdi: json["ilce_adi"],
        nufus: json["nufus"],
        erkekNufus: json["erkek_nufus"],
        kadinNufus: json["kadin_nufus"],
        yuzolcumu: json["yuzolcumu"],
      );

  Map<String, dynamic> toMap() => {
        "ilce_adi": ilceAdi,
        "nufus": nufus,
        "erkek_nufus": erkekNufus,
        "kadin_nufus": kadinNufus,
        "yuzolcumu": yuzolcumu,
      };
}
