import 'package:hava_durumu/Models/local_depolama_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage implements LocalDepolama {
  // abstract factory
  _getPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs;
  }

  @override
  Future<List<String>?> sehirEkle(String sehirAdi) async {
    SharedPreferences prefs = await _getPreferences();

    List<String>? sehirler = await listeGetir();

    if (sehirler == null) {
      sehirler = [sehirAdi];
    } else {
      sehirler.add(sehirAdi);
    }

    prefs.setStringList("sehirler", sehirler!);

    return sehirler!;
  }

  @override
  Future<List<String>> sehirGetir() async {
    SharedPreferences prefs = await _getPreferences();

    List<String>? sehirler = await listeGetir();

    return sehirler!;
  }

  @override
  Future<List<String>> sehirSil(String sehirAdi) async {
    SharedPreferences prefs = await _getPreferences();
    List<String>? sehirler = await listeGetir();
    await sehirler!.remove(sehirAdi);
    await prefs.setStringList("sehirler", sehirler);

    return sehirler!;
  }

  @override
  Future<List<String>?> listeGetir() async {
    SharedPreferences prefs = await _getPreferences();
    List<String>? sehirler = await prefs.getStringList("sehirler");
    return sehirler;
  }
}
