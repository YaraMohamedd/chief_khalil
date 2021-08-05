import 'dart:convert';

import 'package:chief_khalil/Controller/local_storage/local_storage.dart';
import 'package:chief_khalil/Services/api_links.dart';
import 'package:flutter/material.dart';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:chief_khalil/Screens/sign_in_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  final String myString;

  const SignUpScreen({Key key, this.myString});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  LocalStorage localStorage;
  SharedPreferences prefs;
  String myString;
  Future RegistrationUser() async {
    var APIURL = Uri.parse(AppUrl.registration);
    Map mapData = {
      'name': usernameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'password': passController.text,
      'password_confirmation': confirmController.text,
      'birthDate': birthDateController.text,
      'gender': genderController.text,
      'city': cityController.text,
      'country': countryController.text,
      'jobTitle': jobTitleController.text,
    };
    http.Response response = await http.post(APIURL, body: mapData);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // Get.to(() => ControlView());
      print(data);
    }
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myString = prefs.getString('value');
      print("shared:$myString");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _loadCounter();
    });
    // localStorage=LocalStorage();
    // localStorage.languageSelected.then((value){
    //   setState(() {
    //     lang=value;
    //   });
    // });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final key = GlobalKey<ScaffoldState>();
  String _username,
      _password,
      _confirmPassword,
      _phone,
      _email,
      _city,
      _country,
      _birthDate,
      _gender,
      _jobTitle;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  String dropdownValue;
  String country;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          widget.myString == 'en' ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFF20252B),
          title: Text(
            'SignUp'.tr,
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
        drawer: MyDrawer(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 800 || constraints.maxHeight > 300) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            'SignUp'.tr,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFC834B)),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: Form(
                        child: Directionality(
                          textDirection: myString == 'en'
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '*this field is required'.tr;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'First Name'.tr,
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SvgPicture.asset(
                                        'icons/iconfinder_Username_372902.svg',
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
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '*this field is required'.tr;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Last Name'.tr,
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SvgPicture.asset(
                                        'icons/iconfinder_Username_372902.svg',
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
                                height: 20,
                              ),
                              TextFormField(
                                showCursor: false,
                                decoration: InputDecoration(
                                    // hintText: 'Gender'.tr,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 10),
                                      child: DropdownButton<String>(
                                        hint: widget.myString == 'en'
                                            ? Text('Gender')
                                            : Text('Gender'.tr),
                                        value: dropdownValue,
                                        icon: Icon(
                                            Icons.keyboard_arrow_down_rounded),
                                        iconSize: 30,
                                        elevation: 16,
                                        style: TextStyle(color: Colors.black),
                                        underline: SizedBox(),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            dropdownValue = newValue;
                                          });
                                        },
                                        items: <String>[
                                          widget.myString == 'en'
                                              ? 'male'
                                              : 'male'.tr,
                                          widget.myString == 'en'
                                              ? 'female'
                                              : 'female'.tr
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              textAlign: TextAlign.left,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    suffixIcon: Icon(Icons.female_outlined),
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15)),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
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
                                height: 20,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Phone Number'.tr,
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SvgPicture.asset(
                                        'icons/iconfinder_call_322424.svg',
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
                                height: 20,
                              ),
                              TextFormField(
                                showCursor: false,
                                decoration: InputDecoration(
                                    //  hintText: 'Choose Your Country'.tr,
                                    suffixIcon: Icon(Icons.flag_outlined),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: DropdownButton<String>(
                                        value: country,
                                        icon: Icon(
                                            Icons.keyboard_arrow_down_rounded),
                                        iconSize: 30,
                                        elevation: 16,
                                        hint: widget.myString == 'en'
                                            ? Text('Country')
                                            : Text('Country'.tr),
                                        style: TextStyle(color: Colors.black),
                                        underline: SizedBox(),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            country = newValue;
                                          });
                                        },
                                        items: <String>[
                                          widget.myString == 'en'
                                              ? 'Egypt'
                                              : 'Egypt'.tr,
                                          widget.myString == 'en'
                                              ? 'Syrian Arab Republic'
                                              : 'Syrian Arab Republic'.tr,
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              textAlign: TextAlign.right,
                                            ),
                                          );
                                        }).toList(),
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
                                height: 20,
                              ),
                              TextFormField(
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
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Confirm Password'.tr,
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
                                margin: EdgeInsets.only(
                                    top: 15, right: 20, left: 20),
                                width: double.infinity,
                                height: 40,
                                child: RaisedButton(
                                  shape: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen()));
                                  },
                                  color: Color(0xFFFC834B),
                                  child: Text(
                                    'SignUp'.tr,
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
                                          builder: (context) =>
                                              SignInScreen()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 15, top: 10, bottom: 3),
                                  alignment: Alignment.center,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Already Have an Account?".tr,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0xFFFC834B),
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Login".tr,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xFFFC834B),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
