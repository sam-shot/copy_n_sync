
import 'package:copy_n_sync/app/app.logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService{
  static SharedPreferencesService? _instance;
  static late  SharedPreferences _preferences;
  final log = getLogger("SharedPreferncesservice");


  // Using a singleton pattern
  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  // Private generic method for retrieving data from shared preferences
  dynamic getData(String key) {
    // Retrieve data from shared preferences
    var value = _preferences.get(key);

    // Easily log the data that we retrieve from shared preferences
    log.v('Retrieved $key: $value');

    // Return the data that we retrieve from shared preferences
    return value;
  }

  void deleteData(String key)  {
     _preferences.remove(key);
  }

  // Private method for saving data to shared preferences
   saveData(String key, dynamic value) {
    // Easily log the data that we save to shared preferences
    log.v('Saving $key: $value');

    // Save data to shared preferences
    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }


}