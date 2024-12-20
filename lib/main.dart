import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hava_durumu/Constants/colors.dart';
import 'package:hava_durumu/Constants/constants.dart';
import 'package:hava_durumu/Constants/texts.dart';
import 'package:hava_durumu/Models/Sehirler.dart';
import 'package:hava_durumu/Pages/favori_sayfasi.dart';
import 'package:hava_durumu/Pages/sonuc_sayfasi.dart';
import 'package:hava_durumu/Services/convertJson.dart';
import 'package:hava_durumu/Widgets/drop_down_buttons.dart';
import 'package:hava_durumu/Widgets/home_page_favorites.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Durumu Uygulaması',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Constants c = Constants.builder // builder
        .appbarTexts(TextStyle(fontSize: 24, color: Colors.black))
        .homePageAppBarText("Hava Durumu Uygulaması")
        .homePageAppBar(Colors.orange)
        .build();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          c.homePageAppBarText,
          style: c.appbarTexts,
        ),
        backgroundColor: c.homePageAppBar,
      ),
      body: DropDownButtonsWidget(
        homePage: true,
        guncelle: () {},
      ),
      floatingActionButton: HomePageFavorites(),
    );
  }
}
