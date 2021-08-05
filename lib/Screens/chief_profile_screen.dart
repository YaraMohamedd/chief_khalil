
import 'package:chief_khalil/Blocs/chief_bloc.dart';
import 'package:chief_khalil/Models/cheif_model.dart';
import 'package:chief_khalil/Screens/chief_all_courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ChiefProfile extends StatefulWidget {
  final Chiefs chiefs;
  final String myString;
  const ChiefProfile({this.chiefs, this.myString});
  @override
  _ChiefProfileState createState() => _ChiefProfileState();
}

class _ChiefProfileState extends State<ChiefProfile> {
  _launchURL() async {
    const url =
        'https://www.google.com/search?q=snapchat+login&rlz=1C1CHBD_arEG937EG937&oq=snapsha&aqs=chrome.3.69i57j0i10i433j0i10i131i433j0i10i433j0i10l6.6238j0j7&sourceid=chrome&ie=UTF-8';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        forceSafariVC: false,
      );
    } else {
      throw 'Could not launch';
    }
  }

  _launchURL2() async {
    const url = 'https://www.facebook.com/';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        forceSafariVC: false,
      );
    } else {
      throw 'Could not launch';
    }
  }

  _launchURL3() async {
    const url = 'https://mail.google.com/mail/u/0/#inbox';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        forceSafariVC: false,
      );
    } else {
      throw 'Could not launch';
    }
  }

  _launchURL4() async {
    const url =
        'https://www.google.com/search?q=twitter+login&rlz=1C1CHBD_arEG937EG937&oq=twitter&aqs=chrome.1.69i59j0i67i131i433l3j69i60l4.3362j0j7&sourceid=chrome&ie=UTF-8';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        forceSafariVC: false,
      );
    } else {
      throw 'Could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    bloc.getTopChiefs();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xFF20252B),
        title: Text(widget.chiefs.fname + '\t' + widget.chiefs.lname),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection:
              widget.myString == 'en' ? TextDirection.ltr : TextDirection.rtl,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Center(
                child: CircleAvatar(
                    radius: 130,
                    backgroundImage: NetworkImage(
                      widget.chiefs.image,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 10, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.chiefs.fname + '\t' + widget.chiefs.lname,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * .15),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Color(0xFFFC834B),
                          size: 30,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchURL4();
                          },
                          child: SvgPicture.asset(
                            'icons/iconfinder_BW_Twitter_glyph_svg_5305170.svg',
                            width: 15,
                            color: Color(0xFFA7A7A7),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .01,
                        ),
                        // Text(
                        //   widget.chiefs.twitter,
                        //   style: TextStyle(fontSize: 15),
                        // )
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _launchURL2();
                          },
                          child: SvgPicture.asset(
                            'icons/iconfinder_social-facebook_216078.svg',
                            width: 30,
                            color: Color(0xFFA7A7A7),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .002,
                        ),
                        // Text(
                        //   widget.chiefs.facebook,
                        //   style: TextStyle(fontSize: 15),
                        // )
                      ],
                    ),
                    Row(
                      children: [
                        // Text(widget.chiefs.snapchat),
                        GestureDetector(
                          onTap: () {
                            _launchURL();
                          },
                          child: SvgPicture.asset(
                            'icons/icons8-snapchat.svg',
                            width: 30,
                            color: Color(0xFFA7A7A7),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .002,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .03,
                        ),
                        GestureDetector(
                            onTap: () {
                              _launchURL3();
                            },
                            child: Icon(Icons.mail_outline)),
                        // Text(
                        //   widget.chiefs.email,
                        //   style: TextStyle(fontSize: 15),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: TabBar(
                        labelColor: Color(0xFF000000),
                        indicatorColor: Color(0xFFFC834B),
                        unselectedLabelColor: Color(0xFF525252),
                        tabs: [
                          Tab(
                            text: 'Biography',
                          ),
                          Tab(text: 'Skills'),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .21,
                      child: TabBarView(children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            color: Color(0xFFFAFAFA),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 3,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ListTile(
                                      title: widget.myString == 'en'
                                          ? Text(widget.chiefs.biographyEn)
                                          : Text(widget.chiefs.biographyAr)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            color: Color(0xFFFAFAFA),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 3,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(widget.chiefs.professionalLifeEn),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    child: ElevatedButton(
                      child: Text(
                        'Send Message'.tr,
                        style: TextStyle(
                            color: Color(0xFFFC834B),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.white,
                        side: BorderSide(color: Color(0xFFFC834B), width: 1),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: 40,
                    child: ElevatedButton(
                      child: Text(
                        'View His Courses'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFC834B),
                        onPrimary: Colors.white,
                        side: BorderSide(color: Color(0xFFFC834B), width: 1),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllCoursesScreen(
                                      chiefs: Chiefs(
                                          id: widget.chiefs.id,
                                          fname: widget.chiefs.fname,
                                          lname: widget.chiefs.lname),
                                    )));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
