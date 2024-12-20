import 'package:hava_durumu/Models/factory_interface.dart';
import 'package:hava_durumu/Models/local_depolama_interface.dart';
import 'package:hava_durumu/Services/shared_preferences.dart';

class GetSharedPreferences implements FactoryInterface {
  // abstract factory
  @override
  LocalDepolama getWeather() {
    LocalStorage l = new LocalStorage();
    return l;
  }
}
