abstract class LocalDepolama {
  // abstract factory
  Future<List<String>?> sehirEkle(String sehirAdi);
  Future<List<String>> sehirGetir();
  Future<List<String>> sehirSil(String sehirAdi);
  Future<List<String>?> listeGetir();
}
