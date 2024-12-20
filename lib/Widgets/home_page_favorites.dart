import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hava_durumu/Pages/favori_sayfasi.dart';

class HomePageFavorites extends StatelessWidget {
  const HomePageFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => FavoriSayfasi(),
          ),
        );
      },
      child: Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      backgroundColor: Colors.blue,
    );
  }
}
