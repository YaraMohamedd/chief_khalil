import 'dart:io';

import 'package:chief_khalil/Controller/local_storage/local_storage.dart';
import 'package:chief_khalil/Screens/about_us_screen.dart';
import 'package:chief_khalil/Screens/chef_team_screen.dart';
import 'package:chief_khalil/Screens/contact_us_screen.dart';
import 'package:chief_khalil/Screens/course_screen.dart';
import 'package:chief_khalil/Screens/home_page_screen.dart';
import 'package:chief_khalil/Screens/live_screen.dart';
import 'package:chief_khalil/Screens/profile_screen.dart';
import 'package:chief_khalil/Screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  final UserToken args;
  const MyDrawer({Key key, this.args}) : super(key: key);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  LocalStorage localStorage;
  SharedPreferences prefs;
  String lang;
  String myString;
  Locale _appLocale = Locale('ar');
  Locale get appLocal => _appLocale ?? Locale("ar");
  String _selectedLang = 'en';
  bool isSelected = true;
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myString = prefs.getString('value');
      print("shared:$myString");
    });
  }

  Future logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('remember_token');
    final newURI =
        Uri.https('www.chefkhalil.com', '/api/auth/logout', {'token': token});
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    http.Response response = await http.post(newURI, headers: headers);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getPrefs();
    //  localStorage=LocalStorage();
    //  localStorage.languageSelected.then((value){
    setState(() {
      // lang=value;
      // print(lang);
      _loadCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Directionality(
        textDirection:
            _selectedLang == 'en' ? TextDirection.ltr : TextDirection.rtl,
        child: ListView(
          children: [
            Ink(
              color: isSelected ? Color(0xFFF9E4AC) : Colors.transparent,
              child: ListTile(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  Get.to(HomePage(), arguments: myString);
                },
                leading: SvgPicture.asset(
                  'icons/iconfinder_Map_-_Location_Solid_Style_08_2216350.svg',
                  width: 29,
                  color: Color(0xFFFC834B),
                ),
                title: Text(
                  'Home Page'.tr,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Ink(
              color: isSelected ? Color(0xFFF9E4AC) : Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUsScreen()));
                },
                leading: SvgPicture.asset(
                  'icons/iconfinder_info_information_about_help_5402388.svg',
                  width: 29,
                  color: Color(0xFFFC834B),
                ),
                title: Text(
                  'About Us'.tr,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Ink(
              color: isSelected ? Color(0xFFF9E4AC) : Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CourseScreen()));
                },
                leading: SvgPicture.asset(
                  'icons/iconfinder_Education_flat-34_6771586.svg',
                  width: 29,
                  color: Color(0xFFFC834B),
                ),
                title: Text(
                  'Courses'.tr,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Ink(
              color: isSelected ? Color(0xFFF9E4AC) : Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChefTeamScreen()));
                },
                leading: SvgPicture.asset(
                  'icons/iconfinder_General_Office_32_2530819.svg',
                  width: 29,
                  color: Color(0xFFFC834B),
                ),
                title: Text(
                  'Chief Team'.tr,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Ink(
              color: isSelected ? Color(0xFFF9E4AC) : Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LiveScreen()));
                },
                leading: SvgPicture.asset(
                  'icons/iconfinder_red-tv-show-translation-live-broadcast_3993851.svg',
                  width: 29,
                  color: Color(0xFFFC834B),
                ),
                title: Text(
                  'Live'.tr,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Ink(
              color: isSelected ? Color(0xFFF9E4AC) : Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactUsScreen()));
                },
                leading: SvgPicture.asset(
                  'icons/iconfinder_ic_contact_phone_48px_3669371.svg',
                  width: 29,
                  color: Color(0xFFFC834B),
                ),
                title: Text(
                  'Contact Us'.tr,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(
              color: Color(0xFFBCBCBC),
              thickness: 1,
            ),
            Ink(
              color: isSelected ? Color(0xFFF9E4AC) : Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                leading: SvgPicture.asset(
                  'icons/iconfinder_user_profile_edit_103781.svg',
                  width: 29,
                  color: Color(0xFFFC834B),
                ),
                title: Text(
                  'Profile'.tr,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Ink(
              color: isSelected ? Color(0xFFF9E4AC) : Colors.white,
              child: ListTile(
                onTap: () {
                  logoutUser();
                },
                leading: SvgPicture.asset(
                  'icons/iconfinder_logout_account_exit_door_3005766.svg',
                  width: 29,
                  color: Color(0xFFFC834B),
                ),
                title: Text(
                  'Log Out'.tr,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // GetBuilder<AppLanguage>(
            //  init: AppLanguage(),
            //   builder: (controller){
            //    return    DropdownButton(
            //      value: myString,
            //      onChanged: (value)async{
            //        controller.changeLanguage(value);
            //        setState(() {
            //          _selectedLang=value;
            //        });
            //        Get.updateLocale(Locale(value));
            //        SharedPreferences prefs = await SharedPreferences.getInstance();
            //        prefs.setString('value', value);
            //        print(value);
            //        SharedPreferences x = await SharedPreferences.getInstance();
            //        setState(() {
            //          myString = x.getString('value');
            //          print("shared:$myString");
            //        });
            //      },
            //      items: [
            //        DropdownMenuItem(
            //            child: Text('en'),
            //            value:'en'
            //        ),
            //        DropdownMenuItem(
            //            child: Text('ar'),
            //            value:'ar'
            //        )
            //      ],
            //    );
            //   },

            // )
          ],
        ),
      ),
    );
  }
}

class UserToken {
  final String token;
  UserToken(this.token);
}
