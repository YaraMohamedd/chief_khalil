
import 'package:chief_khalil/Blocs/chief_course_bloc.dart';
import 'package:chief_khalil/Models/chief_course_model.dart';
import 'package:chief_khalil/Responsive/size_helper.dart';
import 'package:chief_khalil/Screens/dart_screen.dart';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
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
    // blocc.getTopChiefCourses();
  }

  @override
  Widget build(BuildContext context) {
    blocc.getTopChiefCourses();
    return Directionality(
      textDirection: myString=='en'?TextDirection.ltr:TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFF20252B),
          title: Text(
            'Courses'.tr,
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
        body: Container(
          width: SizeHelper.of(context).help(
              mobileSmall: 320,
              mobileNormal: 720,
              mobileLarge: 480,
              mobileExtraLarge: double.infinity,
              mobileLargeLandScape: double.infinity,
              mobileNormalLandScape: double.infinity,
              mobileExtraLargeLandScape: double.infinity),
          height: SizeHelper.of(context).help(
              mobileSmall: 480,
              mobileLarge: 800,
              mobileExtraLarge: 960,
              mobileExtraLargeLandScape: MediaQuery.of(context).size.height,
              mobileNormalLandScape: MediaQuery.of(context).size.height),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text(
                          'All Courses'.tr,
                          style: TextStyle(
                              color: Color(0xFF78BF4D),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))),
                SizedBox(height: MediaQuery.of(context).size.height / 15),
                StreamBuilder(
                  stream: blocc.topChiefCourse,
                  builder: (context, AsyncSnapshot<Course> snapshot) {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildList(BuildContext context, AsyncSnapshot<Course> snapshot) {
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
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ScreenTest(
                //               courses: Coursess(
                //                   id: snapshot.data.data.courses[index].id),
                //             )));
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenTest((
                //   image: 'https://chefkhalil.com/public/assets/images/courses/${snapshot.data.data.courses[index].image}',
                //   id: snapshot.data.data.courses[index].id,
                //   nameAr: '${snapshot.data.data.courses[index].nameAr}',
                //   nameEn: '${snapshot.data.data.courses[index].nameEn}',
                //   chiefId: '${snapshot.data.data.courses[index].chiefId}',
                //   categoryId: '${snapshot.data.data.courses[index].chiefId}',
                //   numberOfLessons: '${snapshot.data.data.courses[index].numberOfLessons}',
                //   detailsAr: '${snapshot.data.data.courses[index].detailsAr}',
                //   detailsEn: '${snapshot.data.data.courses[index].detailsEn}'
                // ) ,)));
              },
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Color(0xFFFC834B),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Image.network(
                        "https://chefkhalil.com/public/assets/images/courses/${snapshot.data.data.courses[index].image}",
                        fit: BoxFit.cover,
                        height: SizeHelper.of(context).help(
                            mobileSmall: 100,
                            mobileLarge: 150,
                            mobileExtraLarge: 200),
                        width: SizeHelper.of(context).help(
                            mobileSmall: double.infinity,
                            mobileExtraLarge: double.infinity,
                            mobileLarge: double.infinity)),
                    // Text(snapshot.data.data.courses[index].nameAr, style: TextStyle(
                    //     color: Colors.black,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 15),
                    //
                    // ),
                    myString == 'en'
                        ? Center(
                            child: Text(
                                snapshot.data.data.courses[index].nameEn,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          )
                        : Center(
                            child: Text(
                                snapshot.data.data.courses[index].nameAr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
