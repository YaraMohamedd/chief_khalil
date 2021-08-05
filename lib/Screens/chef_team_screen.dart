import 'dart:async';

import 'package:chief_khalil/Blocs/chief_bloc.dart';
import 'package:chief_khalil/Models/cheif_model.dart';
import 'package:chief_khalil/Responsive/size_helper.dart';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'chief_profile_screen.dart';
import 'package:get/get.dart';

class ChefTeamScreen extends StatefulWidget {
  @override
  _ChefTeamScreenState createState() => _ChefTeamScreenState();
}

class _ChefTeamScreenState extends State<ChefTeamScreen> {
  SharedPreferences prefs;
  String myString;
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myString = prefs.getString('value');
      print("shared:$myString");
    });
  }
  //
  // _launchURL() async {
  //   const url = 'https://www.facebook.com';
  //   if (await canLaunch(url)) {
  //     await launch(url, forceWebView: true);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
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
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _loadCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc.getTopChiefs();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xFF20252B),
        title: Text(
          'Chief Team'.tr.tr,
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
        child: Directionality(
          textDirection:
              myString == 'en' ? TextDirection.ltr : TextDirection.rtl,
          child: Container(
            height: SizeHelper.of(context).help(
                mobileSmall: MediaQuery.of(context).size.height,
                mobileLarge: MediaQuery.of(context).size.height * .9,
                mobileNormal: 720,
                mobileExtraLarge: 1280,
                mobileExtraLargeLandScape: 1280,
                mobileLargeLandScape: 1080,
                mobileNormalLandScape: 800,
                mobileSmallLandScape: 720),
            width: SizeHelper.of(context).help(
              mobileSmall: MediaQuery.of(context).size.width,
              mobileNormal: MediaQuery.of(context).size.width,
              mobileLarge: MediaQuery.of(context).size.width,
              mobileExtraLarge: MediaQuery.of(context).size.width,
              mobileExtraLargeLandScape: MediaQuery.of(context).size.width,
              mobileLargeLandScape: MediaQuery.of(context).size.width,
              mobileNormalLandScape: MediaQuery.of(context).size.width,
              mobileSmallLandScape: MediaQuery.of(context).size.width,
            ),
            child: Column(
              children: [
                Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text(
                          'All Chiefs'.tr,
                          style: TextStyle(
                              color: Color(0xFF78BF4D),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ))),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 13,
                ),
                StreamBuilder(
                  stream: bloc.topChiefs,
                  builder: (context, AsyncSnapshot<Cheif> snapshot) {
                    if (snapshot.hasData) {
                      return buildList(context, snapshot);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(
                        child: CircularProgressIndicator(
                            backgroundColor: Color(0xFFFC834B)));
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 12),
                  child: Text(
                    '© all rights reserved to chef khalil school'.tr,
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, AsyncSnapshot<Cheif> snapshot) {
    return GridView.count(
        shrinkWrap: true,
        primary: false,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
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
        children: List.generate(snapshot.data.data.chiefs.length, (index) {
          return Container(
              child: Card(
            child: Container(
              height: 100,
              // width:MediaQuery.of(context).size.width*.52,
              child: Column(
                children: [
                  Image.network(
                      'https://chefkhalil.com/public/assets/images/chiefs/${snapshot.data.data.chiefs[index].image}',
                      fit: BoxFit.cover,
                      height: SizeHelper.of(context).help(
                          mobileSmall: 100,
                          mobileLarge: 150,
                          mobileExtraLarge: 200),
                      width: SizeHelper.of(context).help(
                          mobileSmall: double.infinity,
                          mobileExtraLarge: double.infinity,
                          mobileLarge: double.infinity)),
                  Text(
                      snapshot.data.data.chiefs[index].fname +
                          '\t\t' +
                          snapshot.data.data.chiefs[index].lname,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          _launchURL2();
                        },
                        child: SvgPicture.asset(
                          'icons/iconfinder_BW_Twitter_glyph_svg_5305170.svg',
                          width: 15,
                          color: Color(0xFFFC834B),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          _launchURL();
                        },
                        child: SvgPicture.asset(
                          'icons/iconfinder_social-facebook_216078.svg',
                          width: 20,
                          color: Color(0xFFFC834B),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
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
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 5,
                          child: ElevatedButton(
                            child: Text(
                              'View Profile'.tr,
                              style: TextStyle(
                                  color: Color(0xFFFC834B),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.white,
                              side: BorderSide(
                                  color: Color(0xFFFC834B), width: 1),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChiefProfile(
                                            chiefs: Chiefs(
                                                image:
                                                    'https://chefkhalil.com/public/assets/images/chiefs/${snapshot.data.data.chiefs[index].image}',
                                                fname:
                                                    '${snapshot.data.data.chiefs[index].fname}',
                                                lname:
                                                    '${snapshot.data.data.chiefs[index].lname}',
                                                email:
                                                    '${snapshot.data.data.chiefs[index].email}',
                                                id: snapshot
                                                    .data.data.chiefs[index].id,
                                                facebook:
                                                    '${snapshot.data.data.chiefs[index].facebook}',
                                                twitter:
                                                    '${snapshot.data.data.chiefs[index].twitter}',
                                                instagram:
                                                    '${snapshot.data.data.chiefs[index].instagram}',
                                                snapchat:
                                                    '${snapshot.data.data.chiefs[index].snapchat}',
                                                biographyAr:
                                                    '${snapshot.data.data.chiefs[index].biographyAr}',
                                                biographyEn:
                                                    '${snapshot.data.data.chiefs[index].biographyEn}',
                                                professionalLifeAr:
                                                    '${snapshot.data.data.chiefs[index].professionalLifeAr}',
                                                professionalLifeEn:
                                                    '${snapshot.data.data.chiefs[index].professionalLifeEn}'),
                                            myString: myString,
                                          )));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.favorite_border_outlined,
                          color: Color(0xFFFC834B),
                          size: 30,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
        }));
  }
}
