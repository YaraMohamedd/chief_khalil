import 'package:chief_khalil/Screens/last_screen.dart';
import 'package:chief_khalil/Screens/splash_screen.dart';
import 'package:chief_khalil/Utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await GetStorage.init();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var email = prefs.getString('email');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _appLocale = Locale('ar');
  Locale get appLocal => _appLocale ?? Locale("ar");
  String _selectedLan = 'en';
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //textDirection: _selectedLan=='en'?TextDirection.ltr:TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: Locale('ar'),
      fallbackLocale: Locale('en'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: SplashScreenPage(),
    );
  }
}
