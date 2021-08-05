import 'package:flutter/material.dart';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:chief_khalil/Screens/edit_profile_screen.dart';
import 'package:chief_khalil/Screens/change password_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SharedPreferences prefs;
  String myString;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xFF20252B),
        title: Text(
          'Profile'.tr,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30, bottom: 10, top: 10),
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
        child: Directionality(
          textDirection:
              myString == 'en' ? TextDirection.ltr : TextDirection.rtl,
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/johnatha.jpg'),
                  ),
                ),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hossam Essam',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'hossamessam@gmail.com',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              )),
              Container(
                margin: EdgeInsets.only(right: 40, left: 40),
                child: Divider(
                  color: Color(0xFFB1B1B1),
                  thickness: 1,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Text(
                        'Edit Profile'.tr,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFC834B)),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileScreen(myString: myString,)));
                      },
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChangePasswordScreen(myString: myString,)));
                        },
                        child: Text(
                          'Change Password'.tr,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFC834B)),
                        )),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .5,
                width: double.infinity,
                margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 4,
                        fit: FlexFit.loose,
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .1,
                                ),
                                Text(
                                  'Full Name'.tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .2,
                                ),
                                Text(
                                  'Hossam Essam',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                )
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20, top: 10),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        fit: FlexFit.loose,
                        child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .1,
                                ),
                                Text(
                                  'Email'.tr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .1,
                                ),
                                Text(
                                  'hossamessam@gmail.com',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                )
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20, top: 10),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .1,
                              ),
                              Text(
                                'Phone Number'.tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .2,
                              ),
                              Text(
                                '0108866644 ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              )
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20, top: 10),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .1,
                              ),
                              Text(
                                'Country'.tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .36,
                              ),
                              Text(
                                'Egypt',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              )
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20, top: 10),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .1,
                              ),
                              Text(
                                'Gender'.tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .36,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
