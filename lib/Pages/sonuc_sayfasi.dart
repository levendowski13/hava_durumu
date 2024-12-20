import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hava_durumu/Models/Hava.dart';
import 'package:hava_durumu/Models/Sehirler.dart';
import 'package:hava_durumu/Services/getWeather.dart';

class HavaDurumuSayfasi extends StatefulWidget {
  final String sehir;
  const HavaDurumuSayfasi({required this.sehir, super.key});

  @override
  State<HavaDurumuSayfasi> createState() => _HavaDurumuSayfasiState();
}

class _HavaDurumuSayfasiState extends State<HavaDurumuSayfasi> {
  Getweather g = Getweather.getWeather();   // singleton
  late Future<List<Hava>> hava;
  @override
  void initState() {
    hava = g.getHava(widget.sehir);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String sehir = widget.sehir;

    return Scaffold(
      appBar: AppBar(
        title: Text(sehir + ' Hava Durumu'),
        backgroundColor: Colors.blue.shade200,
      ),
      body: FutureBuilder(
        future: hava,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            List<Hava> hava = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var h = hava![index];

                      return ListTile(
                        title: Text(h.degree!.split('.')[0] + '°C'),
                        leading: Text(h.date!),
                        trailing: Image.network(h.icon!),
                      );
                    },
                    itemCount: hava!.length,
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  
}
