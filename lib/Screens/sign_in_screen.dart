import 'dart:convert';
import 'package:chief_khalil/Controller/app_language.dart';
import 'package:chief_khalil/Controller/local_storage/local_storage.dart';
import 'package:chief_khalil/Responsive/responsive.dart';
import 'package:chief_khalil/Screens/forget_password_screen.dart';
import 'package:chief_khalil/Screens/hero_section_screen.dart';
import 'package:chief_khalil/Screens/home_page_screen.dart';
import 'package:chief_khalil/Screens/sign_up_screen.dart';
import 'package:chief_khalil/Services/api_links.dart';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFF20252B),
          title: Text(
            'Login'.tr,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 30, bottom: 10, top: 10, left: 30),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/khalil.jpg',
                  )),
            )
          ],
        ),
        // drawer: MyDrawer(),
        body: Responsive(
          mobile: MobileWidget(),
        ));
  }
}

class MobileWidget extends StatefulWidget {
  @override
  _MobileWidgetState createState() => _MobileWidgetState();
}

class _MobileWidgetState extends State<MobileWidget> {
  LocalStorage localStorage;
  SharedPreferences prefs;
  String myString;
  String _selectedLang = 'en';
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myString = prefs.getString('value');
      print("shared:$myString");
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String _email, _password;
  String token;
  Future LoginUser() async {
    var APIURL = Uri.parse(AppUrl.login);
    Map mapData = {
      'email': emailController.text,
      'password': passController.text,
    };
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('email', emailController.text);
    http.Response response = await http.post(APIURL, body: mapData);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      token = data['data']['client']['remember_token'];
      print(token);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('remember_token', token);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HeroSectionScreen(
                    myString: myString,
                  )));
      print(data);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _loadCounter();
    });
    //  _getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: myString == 'en' ? TextDirection.ltr : TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Text(
                    'Login'.tr,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFC834B)),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 100),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      onSaved: (value) {
                        _email = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*this field is required'.tr;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Email'.tr,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset(
                              'icons/iconfinder_mail_115714.svg',
                              width: 3,
                              color: Color(0xFF8A8A8A),
                            ),
                          ),
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      //  textDirection: _appLocale=='en'?TextDirection.rtl:TextDirection.ltr,
                      controller: passController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*this field is required'.tr;
                        } else if (value.length < 6) {
                          return 'password must at least 6 characters'.tr;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value;
                      },
                      decoration: InputDecoration(
                          hintText: 'Password'.tr,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset(
                              'icons/iconfinder_icons_password_1564520.svg',
                              width: 3,
                              color: Color(0xFF8A8A8A),
                            ),
                          ),
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 20, left: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));
                                Get.to(ForgetPasswordScreen(),
                                    arguments: myString);
                              },
                              child: Text(
                                'Forget Your Password ?'.tr,
                                style: TextStyle(
                                    color: Color(0xFFFC834B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            LoginUser();
                          }
                        },
                        color: Color(0xFFFC834B),
                        child: Text(
                          'Login'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen(
                                      myString: myString,
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 15, top: 20),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Does not Have an Account?".tr,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xFFFC834B),
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: '\t\t' + "SignUp".tr,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xFFFC834B),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GetBuilder<AppLanguage>(
                      init: AppLanguage(),
                      builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFFC834B).withOpacity(.7),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.white)),
                            width: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: DropdownButton(
                                  value: myString,
                                  onChanged: (value) async {
                                    controller.changeLanguage(value);
                                    setState(() {
                                      _selectedLang = value;
                                    });
                                    Get.updateLocale(Locale(value));
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString('value', value);
                                    print(value);
                                    SharedPreferences x =
                                        await SharedPreferences.getInstance();
                                    setState(() {
                                      myString = x.getString('value');
                                      print("shared:$myString");
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem(
                                        child: Text('English'), value: 'en'),
                                    DropdownMenuItem(
                                        child: Text('العربيه'), value: 'ar')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
