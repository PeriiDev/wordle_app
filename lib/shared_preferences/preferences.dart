import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _language = 'es';
  static bool _isDarkMode = false;
  static double _money = 1;
  static double _crypto = 1;
  static String _selectedCountry = "EUR";
  static String _selectedCrypto = "BTC";
  static bool _skipTutorial = false;
  static int _digit = 2;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get language {
    return _prefs.getString('language') ?? _language;
  }

  static set language(String value) {
    _language = value;
    _prefs.setString('language', value);
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static double get money {
    return _prefs.getDouble("money") ?? _money;
  }

  static set money(double value) {
    _money = value;
    _prefs.setDouble("money", value);
  }

  static double get crypto {
    return _prefs.getDouble("crypto") ?? _crypto;
  }

  static set crypto(double value) {
    _crypto = value;
    _prefs.setDouble("crypto", value);
  }

  static String get selectedCountry {
    return _prefs.getString('selectedCountry') ?? _selectedCountry;
  }

  static set selectedCountry(String value) {
    _selectedCountry = value;
    _prefs.setString('selectedCountry', value);
  }

  static String get selectedCrypto {
    return _prefs.getString('selectedCrypto') ?? _selectedCrypto;
  }

  static set selectedCrypto(String value) {
    _selectedCrypto = value;
    _prefs.setString('selectedCrypto', value);
  }

  static bool get skipTutorial {
    return _prefs.getBool('skipTutorial') ?? _skipTutorial;
  }

  static set skipTutorial(bool value) {
    _skipTutorial = value;
    _prefs.setBool('skipTutorial', value);
  }

  static int get digit {
    return _prefs.getInt('digit') ?? _digit;
  }

  static set digit(int value) {
    _digit = value;
    _prefs.setInt('digit', value);
  }
}
