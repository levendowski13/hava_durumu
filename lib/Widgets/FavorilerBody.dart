import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hava_durumu/Models/get_shared_preferences.dart';
import 'package:hava_durumu/Models/local_depolama_interface.dart';
import 'package:hava_durumu/Pages/sonuc_sayfasi.dart';
import 'package:hava_durumu/Services/shared_preferences.dart';
import 'package:hava_durumu/Widgets/drop_down_buttons.dart';

class FavorilerBody extends StatefulWidget {
  const FavorilerBody({super.key});

  @override
  State<FavorilerBody> createState() => _FavorilerBodyState();
}

class _FavorilerBodyState extends State<FavorilerBody> {
  late Future<List<String>?> sehirler;
  GetSharedPreferences g = new GetSharedPreferences(); // abstract factory
  late LocalDepolama l;

  @override
  void initState() {
    l = g.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sehirler = l.sehirGetir();
    return Column(
      children: [
        FutureBuilder(
          future: sehirler,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              List<String>? s = snapshot.data;

              return s!.length > 0
                  ? Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          String sehir = s[index];

                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) =>
                                    HavaDurumuSayfasi(sehir: sehir),
                              ));
                            },
                            child: ListTile(
                              title: Text(sehir),
                              trailing: InkWell(
                                onTap: () {
                                  l.sehirSil(sehir);
                                  setState(() {});
                                },
                                child: Icon(Icons.delete),
                              ),
                            ),
                          );
                        },
                        itemCount: s.length,
                      ),
                    )
                  : Center(
                      child: Text("Henüz Favori Eklemediniz!"),
                    );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(50),
          ),
          width: 300,
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Favori Ekle!",
                style: GoogleFonts.beVietnamPro(
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DropDownButtonsWidget(
                homePage: false,
                guncelle: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
