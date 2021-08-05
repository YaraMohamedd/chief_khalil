
import 'package:chief_khalil/Screens/sign_up_screen.dart';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  String myString;
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: myString == 'en' ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFF20252B),
          title: Text(
            'Contact Us'.tr,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      'Contact Us'.tr,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFC834B)),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        showCursor: false,
                        decoration: InputDecoration(
                            hintText: 'Full Name'.tr,
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
                        showCursor: false,
                        decoration: InputDecoration(
                            // hintText: 'Phone Number'.tr,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: DropdownButton<String>(
                                hint: myString == 'en'
                                    ? Text('Student')
                                    : Text('Student'.tr),
                                value: dropdownValue,
                                icon: Icon(Icons.keyboard_arrow_down_rounded),
                                iconSize: 30,
                                elevation: 16,
                                style: TextStyle(color: Colors.black),
                                underline: SizedBox(),
                                onChanged: (String newValue) {
                                  setState(() async {
                                    dropdownValue = newValue;
                                    SharedPreferences x =
                                        await SharedPreferences.getInstance();
                                    setState(() {
                                      myString = x.getString('value');
                                      print("shared:$myString");
                                    });
                                  });
                                },
                                items: <String>[
                                  myString == 'en' ? 'Student' : 'Student'.tr,
                                  myString == 'en'
                                      ? 'Advertisement'
                                      : 'Advertisement'.tr
                                ].map<DropdownMenuItem<String>>((String value) {
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
                            suffixIcon: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Icon(Icons.edit)),
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15)),
                        ),
                        child: TextFormField(
                          showCursor: false,
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Icon(Icons.edit)),
                              hintText: 'Message.....'.tr,
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(
                          shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          color: Color(0xFFFC834B),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Send'.tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
