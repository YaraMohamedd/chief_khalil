import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:chief_khalil/Models/chief_course_model.dart';
import 'package:chief_khalil/Models/one_course_details.dart';
import 'package:chief_khalil/Screens/course_lesson_screen.dart';
import 'package:chief_khalil/Screens/show_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenTest extends StatefulWidget {
  final Coursess courses;
  // final CourseData data;
  final String myString;
  ScreenTest({this.courses, this.myString});

  @override
  _ScreenTestState createState() => _ScreenTestState();
}

class _ScreenTestState extends State<ScreenTest> {
  _launchURL() async {
    const url = 'https://www.facebook.com';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL2() async {
    const url =
        'https://www.google.com/search?q=twitter+login&rlz=1C1CHBD_arEG937EG937&oq=twitter&aqs=chrome.1.69i59j0i67i131i433l3j69i60l4.3362j0j7&sourceid=chrome&ie=UTF-8';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL3() async {
    const url = 'https://www.google.com/search?q=instgram';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  String _platformVersion = 'Unknown';
  Locale _appLocale = Locale('ar');
  Locale get appLocal => _appLocale ?? Locale("ar");

  @override
  void initState() {
    super.initState();
  }

  // shareOnFacebook() async {
  //   String result = await FlutterSocialContentShare.share(
  //       type: ShareType.facebookWithoutImage,
  //       url: "https://www.facebook.com",
  //       quote: "captions");
  //   print(result);
  // }
  //
  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     platformVersion = await FlutterSocialContentShare.platformVersion;
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  //
  // }

  Future allGroupsModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('remember_token');
    final newURI = Uri.https('www.chefkhalil.com',
        '/api/auth/courses/${widget.courses.id}', {'token': token});
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    http.Response response = await http.get(newURI, headers: headers);
    if (response.statusCode == 200) {
      final coursesModel = coursesModelFromJson(response.body);
      return coursesModel;
    }
  }

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
              'Course Details'.tr,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                appLocal == 'ar'
                    ? Center(
                        child: Text(
                          widget.courses.nameEn,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      )
                    : Center(
                        child: Text(
                          widget.courses.nameAr,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Image.network(
                      'https://chefkhalil.com/public/assets/images/courses/${widget.courses.image}',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )),
                Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    width: double.infinity,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setInt('id', widget.courses.id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowCourseScreen(
                                      course: Courses(id: widget.courses.id),
                                      myString: widget.myString,
                                    )));
                      },
                      child: Text(
                        'Show Course'.tr,
                        style: TextStyle(
                            color: Color(0xFF78BF4D),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 2.0, color: Color(0xFF78BF4D)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    width: double.infinity,
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CourseLessonScreen(
                                      course: Courses(
                                        id: widget.courses.id,
                                      ),
                                    )));
                      },
                      child: Text(
                        'Enroll'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Color(0xFF78BF4D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Card(
                    color: Color(0xFFFAFAFA),
                    elevation: 3,
                    child: Container(
                      height: 200,
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          'Description'.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        subtitle: appLocal == 'en'
                            ? Text(widget.courses.detailsEn,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14))
                            : Text(widget.courses.detailsAr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Card(
                    color: Color(0xFFFAFAFA),
                    elevation: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .4,
                      color: Colors.white,
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Course Content'.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Lessons  List  -'.tr +
                                  '${widget.courses.numberOfLessons}' +
                                  'Total'.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            appLocal == 'en'
                                ? Text('-' + widget.courses.nameEn,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14))
                                : Text('-' + widget.courses.nameAr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 20),
                    child: Column(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              'Share On Social Media'.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: Container(
                                child: SvgPicture.asset(
                                  'icons/iconfinder_social-facebook_216078.svg',
                                  color: Colors.white,
                                ),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF3B5998)),
                              ),
                              onTap: () {
                                _launchURL();
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                _launchURL2();
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  'icons/iconfinder_03-twitter_104501.svg',
                                  color: Colors.white,
                                ),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF1DA1F2)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _launchURL3();
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  'icons/iconfinder_38-instagram_1161953.svg',
                                  color: Colors.white,
                                ),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFCC2127)),
                              ),
                            ),

                            // Container(
                            //
                            //   child: SvgPicture.asset('icons/iconfinder_social-facebook_216078.svg',color: Colors.white,),
                            //   width: 40,height: 40,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10),
                            //       color: Color(0xFF3B5998)
                            //   ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 12),
                  child: Text(
                    '© all rights reserved to chef khalil school'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          )

          // body: FutureBuilder(
          //     future: allGroupsModel(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         CoursesModel coursesModel = snapshot.data;
          //         return SingleChildScrollView(
          //           child: Column(
          //             children: [
          //               SizedBox(
          //                 height: MediaQuery.of(context).size.height * .1,
          //               ),
          //               appLocal == 'ar'
          //                   ? Text(
          //                       coursesModel.data.courses.nameEn,
          //                       style: TextStyle(
          //                           color: Colors.black,
          //                           fontWeight: FontWeight.bold,
          //                           fontSize: 22),
          //                     )
          //                   : Text(
          //                       coursesModel.data.courses.nameAr,
          //                       style: TextStyle(
          //                           color: Colors.black,
          //                           fontWeight: FontWeight.bold,
          //                           fontSize: 22),
          //                     ),
          //               SizedBox(
          //                 height: MediaQuery.of(context).size.height * .05,
          //               ),
          //               Container(
          //                   margin: EdgeInsets.only(left: 20, right: 20),
          //                   child: Image.network(
          //                     'https://chefkhalil.com/public/assets/images/courses/${coursesModel.data.courses.image}',
          //                     height: 200,
          //                     width: double.infinity,
          //                     fit: BoxFit.fill,
          //                   )),
          //               Container(
          //                   margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          //                   width: double.infinity,
          //                   height: 40,
          //                   child: OutlinedButton(
          //                     onPressed: () async {
          //                       SharedPreferences prefs =
          //                           await SharedPreferences.getInstance();
          //                       prefs.setInt('id', coursesModel.data.courses.id);
          //                       Navigator.push(
          //                           context,
          //                           MaterialPageRoute(
          //                               builder: (context) => ShowCourseScreen(
          //                                     course: Courses(
          //                                         id: coursesModel
          //                                             .data.courses.id),
          //                                     myString: widget.myString,
          //                                   )));
          //                     },
          //                     child: Text(
          //                       'Show Course'.tr,
          //                       style: TextStyle(
          //                           color: Color(0xFF78BF4D),
          //                           fontSize: 18,
          //                           fontWeight: FontWeight.bold),
          //                     ),
          //                     style: ElevatedButton.styleFrom(
          //                       side: BorderSide(
          //                           width: 2.0, color: Color(0xFF78BF4D)),
          //                       shape: RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(15),
          //                       ),
          //                     ),
          //                   )),
          //               Container(
          //                   margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          //                   width: double.infinity,
          //                   height: 40,
          //                   child: RaisedButton(
          //                     onPressed: () {
          //                       Navigator.push(
          //                           context,
          //                           MaterialPageRoute(
          //                               builder: (context) => CourseLessonScreen(
          //                                     course: Courses(
          //                                       id: coursesModel.data.courses.id,
          //                                     ),
          //                                   )));
          //                     },
          //                     child: Text(
          //                       'Enroll'.tr,
          //                       style: TextStyle(
          //                           color: Colors.white,
          //                           fontSize: 18,
          //                           fontWeight: FontWeight.bold),
          //                     ),
          //                     color: Color(0xFF78BF4D),
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(15),
          //                     ),
          //                   )),
          //               Container(
          //                 margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          //                 child: Card(
          //                   color: Color(0xFFFAFAFA),
          //                   elevation: 3,
          //                   child: Container(
          //                     height: 200,
          //                     color: Colors.white,
          //                     child: ListTile(
          //                       title: Text(
          //                         'Description'.tr,
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 18),
          //                       ),
          //                       subtitle: appLocal == 'en'
          //                           ? Text(coursesModel.data.courses.detailsEn,
          //                               style: TextStyle(
          //                                   color: Colors.black,
          //                                   fontWeight: FontWeight.normal,
          //                                   fontSize: 14))
          //                           : Text(coursesModel.data.courses.detailsAr,
          //                               style: TextStyle(
          //                                   color: Colors.black,
          //                                   fontWeight: FontWeight.normal,
          //                                   fontSize: 14)),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               Container(
          //                 margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          //                 child: Card(
          //                   color: Color(0xFFFAFAFA),
          //                   elevation: 3,
          //                   child: Container(
          //                     height: MediaQuery.of(context).size.height * .4,
          //                     color: Colors.white,
          //                     child: ListTile(
          //                       title: Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Text(
          //                             'Course Content'.tr,
          //                             style: TextStyle(
          //                                 color: Colors.black,
          //                                 fontWeight: FontWeight.bold,
          //                                 fontSize: 18),
          //                           ),
          //                           SizedBox(
          //                             height: 20,
          //                           ),
          //                           Text(
          //                             'Lessons  List  -'.tr +
          //                                 '${coursesModel.data.courses.numberOfLessons}' +
          //                                 'Total'.tr,
          //                             style: TextStyle(
          //                                 color: Colors.black,
          //                                 fontWeight: FontWeight.normal,
          //                                 fontSize: 15),
          //                           ),
          //                           SizedBox(
          //                             height: 20,
          //                           ),
          //                           appLocal == 'en'
          //                               ? Text(
          //                                   '-' +
          //                                       coursesModel.data.courses.nameEn,
          //                                   style: TextStyle(
          //                                       color: Colors.black,
          //                                       fontWeight: FontWeight.normal,
          //                                       fontSize: 14))
          //                               : Text(
          //                                   '-' +
          //                                       coursesModel.data.courses.nameAr,
          //                                   style: TextStyle(
          //                                       color: Colors.black,
          //                                       fontWeight: FontWeight.normal,
          //                                       fontSize: 14)),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               Container(
          //                 margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          //                 child: Container(
          //                   margin: EdgeInsets.only(top: 10, left: 20),
          //                   child: Column(
          //                     children: [
          //                       Container(
          //                         child: Center(
          //                           child: Text(
          //                             'Share On Social Media'.tr,
          //                             style: TextStyle(
          //                                 color: Colors.black,
          //                                 fontWeight: FontWeight.bold,
          //                                 fontSize: 18),
          //                           ),
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         height: 20,
          //                       ),
          //                       Row(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.spaceAround,
          //                         children: [
          //                           GestureDetector(
          //                             child: Container(
          //                               child: SvgPicture.asset(
          //                                 'icons/iconfinder_social-facebook_216078.svg',
          //                                 color: Colors.white,
          //                               ),
          //                               width: 40,
          //                               height: 40,
          //                               decoration: BoxDecoration(
          //                                   borderRadius:
          //                                       BorderRadius.circular(10),
          //                                   color: Color(0xFF3B5998)),
          //                             ),
          //                             onTap: () {
          //                               _launchURL();
          //                             },
          //                           ),
          //                           GestureDetector(
          //                             onTap: () {
          //                               _launchURL2();
          //                             },
          //                             child: Container(
          //                               child: SvgPicture.asset(
          //                                 'icons/iconfinder_03-twitter_104501.svg',
          //                                 color: Colors.white,
          //                               ),
          //                               width: 40,
          //                               height: 40,
          //                               decoration: BoxDecoration(
          //                                   borderRadius:
          //                                       BorderRadius.circular(10),
          //                                   color: Color(0xFF1DA1F2)),
          //                             ),
          //                           ),
          //                           GestureDetector(
          //                             onTap: () {
          //                               _launchURL3();
          //                             },
          //                             child: Container(
          //                               child: SvgPicture.asset(
          //                                 'icons/iconfinder_38-instagram_1161953.svg',
          //                                 color: Colors.white,
          //                               ),
          //                               width: 40,
          //                               height: 40,
          //                               decoration: BoxDecoration(
          //                                   borderRadius:
          //                                       BorderRadius.circular(10),
          //                                   color: Color(0xFFCC2127)),
          //                             ),
          //                           ),

          //                           // Container(
          //                           //
          //                           //   child: SvgPicture.asset('icons/iconfinder_social-facebook_216078.svg',color: Colors.white,),
          //                           //   width: 40,height: 40,
          //                           //   decoration: BoxDecoration(
          //                           //       borderRadius: BorderRadius.circular(10),
          //                           //       color: Color(0xFF3B5998)
          //                           //   ),),
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //               Container(
          //                 margin: EdgeInsets.only(top: 20, bottom: 12),
          //                 child: Text(
          //                   '© all rights reserved to chef khalil school'.tr,
          //                   style: TextStyle(fontSize: 16),
          //                 ),
          //               )
          //             ],
          //           ),
          //         );
          //       }
          //       return Center(child: CircularProgressIndicator());
          //     }),
          ),
    );
  }
}
