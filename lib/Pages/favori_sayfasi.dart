import 'package:flutter/material.dart';
import 'package:hava_durumu/Widgets/FavorilerBody.dart';

class FavoriSayfasi extends StatelessWidget {
  const FavoriSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favoriler"),
        backgroundColor: Colors.red,
      ),
      body: FavorilerBody(),
    );
  }
}
