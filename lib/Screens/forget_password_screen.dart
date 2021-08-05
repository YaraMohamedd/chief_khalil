import 'dart:convert';

import 'package:chief_khalil/Screens/reset_password_screen.dart';
import 'package:chief_khalil/Services/api_links.dart';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

TextEditingController emailController = TextEditingController();

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future forgetPass() async {
    var APIURL = Uri.parse(AppUrl.forgetPassword);
    Map mapData = {
      'email': emailController.text,
    };
    http.Response response = await http.post(APIURL, body: mapData);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResetPasswordScreen(
                    args: UserEmail(emailController.text),
                  )));
      print(data);
    }
  }

  String _email;
  String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xFF20252B),
        title: Text(
          'Forget Password'.tr,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 30, bottom: 10, top: 10, left: 30),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/khalil.jpg',
                )),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Text(
                    'Forget Password'.tr,
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
                child: Directionality(
                  textDirection: Get.arguments == 'en'
                      ? TextDirection.ltr
                      : TextDirection.rtl,
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
                              //borderSide: BorderSide.none
                            )),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 10),
                      //   height: 45,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                      //     color: Colors.grey.withOpacity(.3),
                      //   ),
                      //
                      //   child: TextFormField(
                      //     controller: passController,
                      //     validator: (value) {
                      //       if (value == null || value.isEmpty){
                      //         return '*Required';
                      //       }
                      //       return null ;
                      //     },
                      //     onSaved: (value){
                      //       _password=value;
                      //     },
                      //     decoration: InputDecoration(
                      //         hintText: 'Password',
                      //         suffixIcon: Padding(
                      //           padding: const EdgeInsets.all(15.0),
                      //           child: SvgPicture.asset('icons/iconfinder_icons_password_1564520.svg',width:3,color: Color(0xFF8A8A8A),),
                      //         ),
                      //         hintStyle: TextStyle(fontSize: 14),
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                      //             borderSide: BorderSide.none
                      //         )
                      //     ),
                      //   ),
                      // ),

                      Container(
                        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(
                          shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              forgetPass();
                            }
                          },
                          color: Color(0xFFFC834B),
                          child: Text(
                            'Send'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
