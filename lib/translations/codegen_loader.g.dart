// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "appname": "Freelancer Hospital Applications",
  "welcome": "Welcome",
  "login": "Doctor Login",
  "singup": "Doctor Sign Up",
  "admin": "Yönetici",
  "sicklogin": "Sick Login",
  "sicksingup": "Sick singup",

};
static const Map<String,dynamic> tr_TR = {
  "appname": "Serbest Çalışan Hastane Uygulaması",
  "welcome": "Hoşgeldiniz",
  "login": "Doktor Giriş",
  "singup": "Doktor Kayıt",
  "sicklogin": "Hasta Giriş",
  "sicksingup": "Hasta Kayıt"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "tr_TR": tr_TR};
}
