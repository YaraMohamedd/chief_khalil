import 'dart:convert';
import 'package:chief_khalil/Models/cheif_model.dart';
import 'package:chief_khalil/Models/course_chief_model.dart';
import 'package:chief_khalil/Models/one_course_details.dart';
import 'package:chief_khalil/Screens/course_lesson_screen.dart';
import 'package:chief_khalil/Screens/show_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AllCoursesScreen extends StatefulWidget {
  final Chiefs chiefs;
  AllCoursesScreen({this.chiefs});
  @override
  _AllCoursesScreenState createState() => _AllCoursesScreenState();
}

class _AllCoursesScreenState extends State<AllCoursesScreen> {
  Future<CourseChiefModel> getTopChiefCourse() async {
    var Api = Uri.parse(
        "https://chefkhalil.com/api/chief_all_courses/${widget.chiefs.id}");
    final response = await http.get(Api);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CourseChiefModel.fromJson(json);
    } else {
      throw Exception('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xFF20252B),
        title: Text(
          '${'كورس ' + widget.chiefs.fname} ',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30, bottom: 10, top: 10, left: 30),
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
            FutureBuilder(
                future: getTopChiefCourse(),
                builder: (context, AsyncSnapshot<CourseChiefModel> snapshot) {
                  if (snapshot.hasData) {
                    return SafeArea(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .8,
                        child: ListView.builder(
                            itemCount: snapshot.data.data.courses.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SingleChildScrollView(
                                child: Container(
                                  height: 900,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        '${snapshot.data.data.courses[index].nameEn}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 20, right: 20, left: 20),
                                          child: Image.network(
                                            'https://chefkhalil.com/public/assets/images/courses/${snapshot.data.data.courses[index].image}',
                                            height: 200,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: 20, right: 20),
                                          width: double.infinity,
                                          height: 40,
                                          child: OutlinedButton(
                                            onPressed: () async {
                                              // SharedPreferences prefs = await SharedPreferences.getInstance();
                                              // prefs.setInt('id', coursesModel.data.courses.id);
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              var ID = prefs.getInt('id');
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShowCourseScreen(
                                                      course: Courses(id: ID),
                                                    ),
                                                  ));
                                            },
                                            child: Text(
                                              'Show Course',
                                              style: TextStyle(
                                                  color: Color(0xFF78BF4D),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                  width: 2.0,
                                                  color: Color(0xFF78BF4D)),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: 20, right: 20),
                                          width: double.infinity,
                                          height: 40,
                                          child: RaisedButton(
                                              color: Color(0xFF78BF4D),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Text('Enroll',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              onPressed: () async {
                                                SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                var id = prefs.getInt('id');
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CourseLessonScreen(
                                                              course: Courses(
                                                                  id: id),
                                                            )));
                                                // Navigator.push(context,MaterialPageRoute(builder: (context)=>CourseLessonScreen(args: Coursess(
                                                //   courseId: snapshot.data.data.courses[index].courseId
                                                // ),)));
                                              })),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 20, left: 20, right: 20),
                                        child: Card(
                                          color: Color(0xFFFAFAFA),
                                          elevation: 3,
                                          child: Container(
                                            height: 150,
                                            color: Colors.white,
                                            child: ListTile(
                                              title: Text(
                                                'Description',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              subtitle: Text(
                                                  '${snapshot.data.data.courses[index].detailsEn}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 14)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 20, left: 20, right: 20),
                                        child: Card(
                                          color: Color(0xFFFAFAFA),
                                          elevation: 3,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .2,
                                            color: Colors.white,
                                            child: ListTile(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Course Content',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    'Lessons  List  - ${snapshot.data.data.courses[index].numberOfLessons} Total',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                      '-' +
                                                          '${snapshot.data.data.courses[index].nameEn}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 14)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
