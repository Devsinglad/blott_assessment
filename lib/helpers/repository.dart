import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  static Repository? _instance;
  static late SharedPreferences _pref;
  static late SharedPreferences _appConfig;

  Repository._internal();

  static init() async {
    print(">>initRespository");
    _instance = Repository._internal();
    _pref = await SharedPreferences.getInstance();
    _appConfig = await SharedPreferences.getInstance();
  }

  static Repository? getInstance() {
    return _instance;
  }

  saveQrcode(String url) async {
    _pref.setString('QrCode', url);
  }

  String? getQrCode() {
    return _pref.getString('QrCode');
  }

  setFirstTime() async {
    _appConfig.setString('firstTime', "true");
  }

  String? getToken() {
    return _pref.getString('Token');
  }

  String? getFirstTime() {
    return _appConfig.getString('firstTime');
  }

  saveFirstName(String name) async {
    _pref.setString('firstName', name);
  }

  saveLastName(String name) async {
    _pref.setString('lastName', name);
  }

  String? getName() {
    return _pref.getString('firstName');
  }

  String? getLastName() {
    return _pref.getString('lastName');
  }

  reset() {
    _pref.clear();
  }
}
