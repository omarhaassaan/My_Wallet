import 'package:shared_preferences/shared_preferences.dart';

// Keys for my wallet application
const amountKey = 'amount_key_double';

class LocalStorage {
// Setters
  static readDouble(key) async {
    final _store = await SharedPreferences.getInstance();
    return _store.getDouble(key) ?? 0;
  }

// Getters
  static writeInt(key, data) async {
    final _store = await SharedPreferences.getInstance();
    await _store.setInt(key, data);
  }

  static writeDouble(key, data) async {
    final _store = await SharedPreferences.getInstance();
    await _store.setDouble(key, data);
  }

  static writeString(key, data) async {
    final _store = await SharedPreferences.getInstance();
    await _store.setString(key, data);
  }

  static writeBool(key, data) async {
    final _store = await SharedPreferences.getInstance();
    await _store.setBool(key, data);
  }
}
