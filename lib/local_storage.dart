import 'package:shared_preferences/shared_preferences.dart';

// Keys for my wallet application
const amountKey = 'amount_key_double';
const paymentNamesKey = 'payment_names_key_strings';
const paymentAmountsKey = 'payment_amounts_key_strings';

class LocalStorage {
// Setters
  static readDouble(key) async {
    final _store = await SharedPreferences.getInstance();
    return _store.getDouble(key) ?? 0.0;
  }

  static readStrings(key) async {
    final _store = await SharedPreferences.getInstance();
    return _store.getStringList(key) ?? null;
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

  static writeStrings(key, data) async {
    final _store = await SharedPreferences.getInstance();
    await _store.setStringList(key, data);
  }

  static resetStorage() async {
    final _store = await SharedPreferences.getInstance();
    return await _store.clear();
  }
}
