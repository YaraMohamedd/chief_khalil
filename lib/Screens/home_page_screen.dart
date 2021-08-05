import 'dart:convert';
import 'package:chief_khalil/Blocs/chief_bloc.dart';
import 'package:chief_khalil/Blocs/chief_course_bloc.dart';
import 'package:chief_khalil/Controller/local_storage/local_storage.dart';
import 'package:chief_khalil/Models/cheif_model.dart';
import 'package:chief_khalil/Models/chief_course_model.dart';
import 'package:chief_khalil/Responsive/size_helper.dart';
import 'package:chief_khalil/Screens/about_us_screen.dart';
import 'package:chief_khalil/Screens/chef_team_screen.dart';
import 'package:chief_khalil/Screens/chief_profile_screen.dart';

import 'package:chief_khalil/Screens/contact_us_screen.dart';
import 'package:chief_khalil/Screens/course_details_screen.dart';

import 'package:chief_khalil/Screens/dart_screen.dart';
import 'package:chief_khalil/Screens/live_screen.dart';
import 'package:chief_khalil/Screens/profile_screen.dart';
import 'package:chief_khalil/Screens/sign_in_screen.dart';
import 'package:chief_khalil/Services/api_links.dart';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chief_khalil/Screens/hero_section_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final CourseData data;
  final String myString;
  const HomePage({this.data, this.myString});
// final  MyDrawer drawer;
//   // final UserToken args;
//   //
//   const HomePage({Key key, this.drawer}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  Locale _appLocale = Locale('ar');
  LocalStorage localStorage;
  SharedPreferences prefs;
  String lang;
  Locale get appLocal => _appLocale ?? Locale("ar");
  String _selectedLang = 'en';
  bool isSelected = true;
  // Future logoutUser()  async{
  //   var APIURL = Uri.parse(AppUrl.logout);
  //   Map mapData ={
  //     "token": widget.args.token,
  //   };
  //   http.Response response = await http.post(APIURL,body:mapData);
  //   if(response.statusCode == 200){
  //     var data = jsonDecode(response.body);
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
  //     print(data);
  //   }
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // localStorage=LocalStorage();
    // localStorage.languageSelected.then((value){
    //     setState(() {
    //         lang=value;
    //         print(lang);
    //     });
    // });
  }

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
    const url = 'https://www.google.com/';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    blocc.getTopChiefCourses();
    bloc.getTopChiefs();
    return Directionality(
      textDirection:
          widget.myString == 'en' ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFF20252B),
          title: Text(
            'Home Page'.tr,
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
        drawer:  MyDrawer(),
        body:Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                          child: Text(
                            'Follow with us all new'.tr,
                            style: TextStyle(
                                color: Color(0xFF78BF4D),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))),
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                          child: Text(
                            'Our Cooking Classes'.tr,
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ))),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        'assets/icon.png',
                        width: 27,
                        height: 30,
                      )),
                  StreamBuilder(
                    stream: blocc.topChiefCourse,
                    builder: (context, AsyncSnapshot<Course> snapshot) {
                      if (snapshot.hasData) {
                        return buildList(snapshot);
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Color(0xFFFC834B)));
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          // Text(
                          //   'View More Classes'.tr,
                          //   style: TextStyle(
                          //       color: Color(0xFFFC834B),
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Icon(Icons.arrow_forward_ios,
                          //       color: Color(0xFFFC834B)),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        top: 40,
                      ),
                      child: Text('Our team of professionals'.tr,
                          style: TextStyle(
                              color: Color(0xFF78BF4D),
                              fontSize: 18,
                              fontWeight: FontWeight.bold))),
                  Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text('Best Chefs of Chef’s Khalil School'.tr,
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 22,
                              fontWeight: FontWeight.bold))),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .02),
                      child: Image.asset('assets/greenicon.png')),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  StreamBuilder(
                      stream: bloc.topChiefs,
                      builder: (context, AsyncSnapshot<Cheif> snapshot) {
                        if (snapshot.hasData) {
                          return SizedBox(
                            // height: 200,

                            height:   SizeHelper.of(context).help(
                                mobileSmall: MediaQuery.of(context).size.height * .2,
                                mobileNormal: MediaQuery.of(context).size.height * .3,
                                mobileLarge: MediaQuery.of(context).size.height * .4,
                                mobileExtraLarge: MediaQuery.of(context).size.height * .5,
                                mobileExtraLargeLandScape:
                                MediaQuery.of(context).size.height * .5,
                                mobileLargeLandScape: MediaQuery.of(context).size.height * .5,
                                mobileNormalLandScape: MediaQuery.of(context).size.height * .4,
                                mobileSmallLandScape: MediaQuery.of(context).size.height * .4),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Container(
                                    height:   SizeHelper.of(context).help(
                                        mobileSmall: MediaQuery.of(context).size.height * .2,
                                        mobileNormal: MediaQuery.of(context).size.height * .3,
                                        mobileLarge: MediaQuery.of(context).size.height * .4,
                                        mobileExtraLarge: MediaQuery.of(context).size.height * .8,
                                        mobileExtraLargeLandScape:
                                        MediaQuery.of(context).size.height * .5,
                                        mobileLargeLandScape: MediaQuery.of(context).size.height * .5,
                                        mobileNormalLandScape: MediaQuery.of(context).size.height * .4,
                                        mobileSmallLandScape: MediaQuery.of(context).size.height * .4),
                                    // height: 200,
                                    width: 300,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 200,
                                          child: Image.network(
                                              'https://chefkhalil.com/public/assets/images/chiefs/${snapshot.data.data.chiefs[index].image}',
                                              fit: BoxFit.cover,
                                              width: double.infinity),
                                        ),
                                        Text(
                                            snapshot.data.data
                                                .chiefs[index].fname +
                                                '\t\t' +
                                                snapshot.data.data
                                                    .chiefs[index].lname,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18)),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _launchURL2();
                                              },
                                              child: SvgPicture.asset(
                                                'icons/iconfinder_BW_Twitter_glyph_svg_5305170.svg',
                                                width: 15,
                                                color: Color(0xFFFC834B),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _launchURL();
                                              },
                                              child: SvgPicture.asset(
                                                'icons/iconfinder_social-facebook_216078.svg',
                                                width: 20,
                                                color: Color(0xFFFC834B),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _launchURL3();
                                              },
                                              child: SvgPicture.asset(
                                                'icons/iconfinder_Google_Plus_alt_703525.svg',
                                                width: 20,
                                                color: Color(0xFFFC834B),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(4.0),
                                          child: Container(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .start,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(8.0),
                                                  child: ElevatedButton(
                                                    child: Text(
                                                      'View Profile'.tr,
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFFFC834B),
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          fontSize: 15),
                                                    ),
                                                    style:
                                                    ElevatedButton
                                                        .styleFrom(
                                                      primary:
                                                      Colors.white,
                                                      onPrimary:
                                                      Colors.white,
                                                      side: BorderSide(
                                                          color: Color(
                                                              0xFFFC834B),
                                                          width: 1),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ChiefProfile(
                                                                    chiefs: Chiefs(
                                                                        image: 'https://chefkhalil.com/public/assets/images/chiefs/${snapshot.data.data.chiefs[index].image}',
                                                                        fname: '${snapshot.data.data.chiefs[index].fname}',
                                                                        lname: '${snapshot.data.data.chiefs[index].lname}',
                                                                        email: '${snapshot.data.data.chiefs[index].email}',
                                                                        facebook: '${snapshot.data.data.chiefs[index].facebook}',
                                                                        twitter: '${snapshot.data.data.chiefs[index].twitter}',
                                                                        instagram: '${snapshot.data.data.chiefs[index].instagram}',
                                                                        snapchat: '${snapshot.data.data.chiefs[index].snapchat}',
                                                                        biographyAr: '${snapshot.data.data.chiefs[index].biographyAr}',
                                                                        biographyEn: '${snapshot.data.data.chiefs[index].biographyEn}',
                                                                        professionalLifeAr: '${snapshot.data.data.chiefs[index].professionalLifeAr}',
                                                                        professionalLifeEn: '${snapshot.data.data.chiefs[index].professionalLifeEn}'),
                                                                  )));
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  color:
                                                  Color(0xFFFC834B),
                                                  size: 30,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: snapshot.data.data.chiefs.length,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                        return Center(
                            child: CircularProgressIndicator(
                                backgroundColor: Color(0xFFFC834B)));
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  Center(
                      child: Text(
                        'Latest news From Chef Khalil School'.tr,
                        style: TextStyle(
                            color: Color(0xFFFC834B),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 54,
                  ),
                  Center(
                      child: Text(
                        'Our Recent Blog Posts'.tr,
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  StreamBuilder(
                    stream: blocc.topChiefCourse,
                    builder: (context, AsyncSnapshot<Course> snapshot) {
                      if (snapshot.hasData) {
                        return buildList(snapshot);
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Color(0xFFFC834B)));
                    },
                  ),
                  Container(
                      margin:
                      EdgeInsets.only(left: 5, top: 20, bottom: 20),
                      child: Text(
                        '© all rights reserved to chef khalil school'.tr,
                        style: TextStyle(
                            color: Color(0xFF4E4E4E), fontSize: 18),
                      ))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HeroSectionScreen()));
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 1.44,
                    left: MediaQuery.of(context).size.width * .9),
                child: CircleAvatar(
                  backgroundColor: Color(0xFFFC834B).withOpacity(.8),
                  child: SvgPicture.asset(
                    'icons/iconfinder_up_2_1_4829858.svg',
                    width: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  Widget buildList(AsyncSnapshot<Course> snapshot) {
    return GridView.count(
        shrinkWrap: true,
        primary: false,
        childAspectRatio: SizeHelper.of(context).help(
            mobileSmall: MediaQuery.of(context).size.width * .5,
            mobileLarge: MediaQuery.of(context).size.width * .5,
            mobileExtraLarge: MediaQuery.of(context).size.width * .5,
            mobileExtraLargeLandScape:
            MediaQuery.of(context).size.width * .5,
            mobileLargeLandScape: MediaQuery.of(context).size.width * .5,
            mobileNormal: MediaQuery.of(context).size.width * .5,
            mobileNormalLandScape: MediaQuery.of(context).size.width * .5,
            mobileSmallLandScape: MediaQuery.of(context).size.width * .5) /
            SizeHelper.of(context).help(
              mobileSmall: MediaQuery.of(context).size.height * .2,
              mobileNormal: MediaQuery.of(context).size.height * .3,
              mobileLarge: MediaQuery.of(context).size.height * .4,
              mobileExtraLarge: MediaQuery.of(context).size.height * .5,
              mobileExtraLargeLandScape:
              MediaQuery.of(context).size.height * .5,
              mobileLargeLandScape: MediaQuery.of(context).size.height * .5,
              mobileNormalLandScape: MediaQuery.of(context).size.height * .4,
              mobileSmallLandScape: MediaQuery.of(context).size.height * .4,
            ),
        crossAxisCount: 2,
        // crossAxisSpacing: 10.0,
        // mainAxisSpacing: 30.0,
        children: List.generate(snapshot.data.data.courses.length, (index) {
          return Container(
            child: GestureDetector(
              onTap: () async {
                //   await Get.to(SignInScreen(),arguments: Get.arguments);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenTest(
                              courses: Coursess(
                                  image:
                                      'https://chefkhalil.com/public/assets/images/courses/${snapshot.data.data.courses[index].image}',
                                  id: snapshot.data.data.courses[index].id,
                                  nameAr:
                                      '${snapshot.data.data.courses[index].nameAr}',
                                  nameEn:
                                      '${snapshot.data.data.courses[index].nameEn}',
                                  chiefId:
                                      '${snapshot.data.data.courses[index].chiefId}',
                                  categoryId:
                                      '${snapshot.data.data.courses[index].chiefId}',
                                  numberOfLessons:
                                      '${snapshot.data.data.courses[index].numberOfLessons}',
                                  detailsAr:
                                      '${snapshot.data.data.courses[index].detailsAr}',
                                  detailsEn:
                                      '${snapshot.data.data.courses[index].detailsEn}'),
                              myString: widget.myString,
                            )));
                SharedPreferences prefs = await SharedPreferences.getInstance();
                var token = prefs.getString('remember_token');
              },
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70,
                      child: Align(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: Color(0xFFFC834B),
                          ),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Container(
                      height: 200,
                      child: Image.network(
                        "https://chefkhalil.com/public/assets/images/courses/${snapshot.data.data.courses[index].image}",
                        fit: BoxFit.cover,
                          height: SizeHelper.of(context).help(
                              mobileSmall: 100,
                              mobileLarge: 150,
                              mobileExtraLarge: 200),
                          width: SizeHelper.of(context).help(
                              mobileSmall: double.infinity,
                              mobileExtraLarge: double.infinity,
                              mobileLarge: double.infinity)
                      ),
                    ),
                    // Text(snapshot.data.data.courses[index].nameAr, style: TextStyle(
                    //     color: Colors.black,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 15),
                    //
                    // ),
                    Get.arguments == 'en'
                        ? Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                  snapshot.data.data.courses[index].nameEn,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                          )
                        : Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                  snapshot.data.data.courses[index].nameAr,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'icons/iconfinder_group_1608916.svg',
                                  width: 20,
                                  color: Color(0xFF78BF4D),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('34'),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Color(0xFF78BF4D),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('16'),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}

// class UserToken {
//   final String token ;
//   UserToken(this.token);
// }
class CourseData {
  final String token;
  CourseData(this.token);
}
