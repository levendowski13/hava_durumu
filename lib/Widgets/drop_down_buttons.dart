import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hava_durumu/Models/Sehirler.dart';
import 'package:hava_durumu/Models/get_shared_preferences.dart';
import 'package:hava_durumu/Models/local_depolama_interface.dart';
import 'package:hava_durumu/Pages/sonuc_sayfasi.dart';
import 'package:hava_durumu/Services/convertJson.dart';
import 'package:hava_durumu/Services/shared_preferences.dart';

class DropDownButtonsWidget extends StatefulWidget {
  final homePage;
  final Function guncelle;
  const DropDownButtonsWidget(
      {required this.homePage, required this.guncelle(), super.key});

  @override
  State<DropDownButtonsWidget> createState() => _DropDownButtonsWidgetState();
}

class _DropDownButtonsWidgetState extends State<DropDownButtonsWidget> {
  late Future<List<Sehirler>> sehirler;
  String? sehir = null;
  String? ilce = null;
  List<Ilceler>? ilceler = null;
  GetSharedPreferences g = new GetSharedPreferences(); // abstract factory
  late LocalDepolama l;

  @override
  void initState() {
    sehirler = Convertjson.donder(context);
    l = g.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sehirler,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          var s = snapshot.data;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  items: s!
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e.ilAdi.toString()),
                          value: e.ilAdi,
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      sehir = value!;
                      ilce = null;
                      for (var e in s) {
                        if (e.ilAdi == value) {
                          ilceler = e.ilceler!;
                        }
                      }
                    });
                  },
                  value: sehir,
                  hint: Text("İl Seçiniz"),
                ),
                ilceler == null
                    ? SizedBox()
                    : DropdownButton(
                        items: ilceler!
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text(e.ilceAdi!),
                                value: e.ilceAdi!,
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            ilce = value;
                          });
                        },
                        value: ilce,
                        hint: Text("İlçe Seçiniz"),
                      ),
                ilce == null
                    ? SizedBox()
                    : ElevatedButton(
                        child: Text(
                          widget.homePage
                              ? "Hava Durumunu Görmek İçin Tıklayınız"
                              : "Favorilere Eklemek İçin Tıklayınız!",
                        ),
                        onPressed: () {
                          if (widget.homePage) {
                            if (ilce == 'Merkez') {
                              pushClass(context, sehir!);
                            } else {
                              pushClass(context, ilce!);
                            }
                          } else {
                            if (ilce == "Merkez") {
                              l.sehirEkle(sehir!);
                            } else {
                              l.sehirEkle(ilce!);
                            }
                            widget.guncelle();
                          }
                        },
                      ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  pushClass(BuildContext context, String veri) {
    Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => HavaDurumuSayfasi(sehir: veri),
    ));
  }
}
