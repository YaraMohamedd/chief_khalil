import 'package:chief_khalil/Screens/home_page_screen.dart';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class HeroSectionScreen extends StatefulWidget {
  final String myString;

  const HeroSectionScreen({Key key, this.myString});
  @override
  _HeroSectionScreenState createState() => _HeroSectionScreenState();
}

class _HeroSectionScreenState extends State<HeroSectionScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          widget.myString == 'en' ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFF20252B),
        // appBar: AppBar(
        //   toolbarHeight: 32,
        //   backgroundColor: Color(0xFF20252B),
        //
        //   actions: [
        //     // Padding(
        //     //   padding: const EdgeInsets.only(right: 30),
        //     //   child: Image.asset('assets/logo.png',height: 20,width: 50,),
        //     // )
        //   ],
        // ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/slide.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            child: GestureDetector(
                                onTap: () {
                                  _scaffoldKey.currentState.openDrawer();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 30),
                                  child: Icon(
                                    Icons.dehaze_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 30,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/khalil.jpg',
                              height: 42,
                              width: 42,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'We play food with fire strings'.tr,
                  style: TextStyle(
                      color: Color(0xFFFC834B),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Watch Our Next Live In'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '33      34      23      29'.tr,
                  style: TextStyle(
                      color: Color(0xFF78BF4D),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Seconds'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11),
                    ),
                    Text(
                      'Minutes'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11),
                    ),
                    Text(
                      'Hours'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11),
                    ),
                    Text(
                      'Days'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11),
                    ),
                  ],
                ),
              )),
              Container(
                margin: EdgeInsets.only(top: 50, right: 20, left: 20),
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                  },
                  color: Color(0xFFFC834B),
                  child: Text(
                    'Watch Soon'.tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .2),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(
                                      myString: widget.myString,
                                    )));
                      },
                      child: SvgPicture.asset(
                        'icons/iconfinder_double-arrow-down_383153.svg',
                        width: 30,
                        color: Colors.white,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
