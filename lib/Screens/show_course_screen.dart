import 'dart:io';

import 'package:chief_khalil/Blocs/course_lesson_bloc.dart';
import 'package:chief_khalil/Models/chief_course_model.dart';
import 'package:chief_khalil/Models/course_lessons_model.dart';
import 'package:chief_khalil/Models/one_course_details.dart';
import 'package:chief_khalil/Screens/course_lesson_screen.dart';
import 'package:chief_khalil/Screens/vedio_item.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

//import 'package:chef_khalil_application/Models/chief_course_model.dart';
class ShowCourseScreen extends StatefulWidget {
  final Courses course;
  final String myString;
  const ShowCourseScreen({this.course, this.myString});
  @override
  _ShowCourseScreenState createState() => _ShowCourseScreenState();
}

class _ShowCourseScreenState extends State<ShowCourseScreen> {
  VideoPlayerController _controller;

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  Future allGroupsModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('remember_token');
    final newURI = Uri.https('www.chefkhalil.com',
        '/api/auth/courses/lessons/${widget.course.id}', {'token': token});
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    http.Response response = await http.get(newURI, headers: headers);
    if (response.statusCode == 200) {
      final coursesModel = courseModelFromJson(response.body);
      return coursesModel;
    }
    print('x');
  }

  Future getTopChiefCourse() async {
    var Api = Uri.parse(
        "https://chefkhalil.com/api/courses/lessons/${widget.course.id}");
    final response = await http.get(Api);
    if (response.statusCode == 200) {
      final coursesModel = courseModelFromJson(response.body);
      return coursesModel;
    } else {
      throw Exception('Error');
    }
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // allGroupsModel();
    getTopChiefCourse();
  }

  @override
  Widget build(BuildContext context) {
    // bloccs.getTopLessonCourses();
    return Directionality(
      textDirection:
          widget.myString == 'en' ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFF20252B),
          title: Text(
            'Show Course'.tr,
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
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 800) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    FutureBuilder(
                      future: getTopChiefCourse(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          CourselessonsModel courselessonsModel = snapshot.data;
                          return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          color: Color(0xFF2F2F2F),
                                          child: Container(
                                            height: 600,
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                courselessonsModel
                                                            .data
                                                            .courses[index]
                                                            .url ==
                                                        0
                                                    ? Expanded(
                                                        child: Container(
                                                          height: 300,
                                                          child: Image.network(
                                                            'https://img.icons8.com/ios/452/no-video--v2.png',
                                                            // width: double.infinity,
                                                            fit: BoxFit.cover,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        height: 300,
                                                        width: double.infinity,
                                                        child: VideoItems(
                                                          videoPlayerController:
                                                              VideoPlayerController
                                                                  .network(
                                                                      'https://chefkhalil.com/public/assets/videos/courses/${courselessonsModel.data.courses[index].url}'),
                                                          looping: true,
                                                          autoplay: false,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                Expanded(
                                                  child: Container(
                                                    height: 300,
                                                    child: ExpansionTileCard(
                                                      key: cardA,
                                                      title: Text(
                                                        '${courselessonsModel.data.courses[index].nameEn}' +
                                                            '\t \t' +
                                                            'Playlist'.tr,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),

                                                      //  trailing: Icon(Icons.keyboard_arrow_up_rounded,color: Colors.white,),
                                                      expandedColor:
                                                          Color(0xFF202020),
                                                      baseColor:
                                                          Color(0xFF2F2F2F),
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: ListTile(
                                                            leading: courselessonsModel
                                                                        .data
                                                                        .courses[
                                                                            index]
                                                                        .image ==
                                                                    0
                                                                ? Image.network(
                                                                    'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=615&q=80',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    width: 140,
                                                                  )
                                                                : Image.network(
                                                                    'https://chefkhalil.com/public/assets/images/courses/${courselessonsModel.data.courses[index].image}'),
                                                            title: widget
                                                                        .myString ==
                                                                    'en'
                                                                ? Text(
                                                                    '${courselessonsModel.data.courses[index].nameEn}' +
                                                                        '\t' +
                                                                        '-' +
                                                                        '\t \t' +
                                                                        'lesson' +
                                                                        '\t' +
                                                                        '${snapshot.data.data.courses[index].lessonNumber}' +
                                                                        '\t' +
                                                                        '${courselessonsModel.data.courses[index].detailsEn}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal))
                                                                : Text(
                                                                    '${courselessonsModel.data.courses[index].nameAr}' +
                                                                        '\t' +
                                                                        '-' +
                                                                        '\t \t' +
                                                                        'lesson' +
                                                                        '\t' +
                                                                        '${snapshot.data.data.courses[index].lessonNumber}' +
                                                                        '\t' +
                                                                        '${courselessonsModel.data.courses[index].detailsAr}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal)),

                                                            // leading:Image.network( 'https://chefkhalil.com/public/assets/images/courses/${snapshot.data.data.courses[index].image}') ,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .02,
                                                ),
                                                Container(
                                                  height: 100,
                                                  child: Text(
                                                    'Enroll To Continue Watching...'
                                                        .tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Container(
                                            height: 50,
                                            width: double.infinity,
                                            child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text('Enroll'.tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                color: Color(0xFFFC834B),
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
                                                                myString: widget
                                                                    .myString,
                                                                course: Courses(
                                                                    id: id),
                                                              )));
                                                  // Navigator.push(context,MaterialPageRoute(builder: (context)=>CourseLessonScreen(args: Coursess(
                                                  //   courseId: snapshot.data.data.courses[index].courseId
                                                  // ),)));
                                                })),
                                      ),

                                      // Image.network('https://chefkhalil.com/public/assets/images/courses/${courselessonsModel.data.courses[index].image}')
                                    ],
                                  );
                                },
                                itemCount:
                                    courselessonsModel.data.courses.length),
                          );

                          // return SafeArea(
                          //   child: SingleChildScrollView(
                          //      child: Column(
                          //        children: [
                          //        AspectRatio(
                          //                                            aspectRatio: 2 / 1,
                          //                                            child: VideoItems(
                          //                                              width: 200,
                          //                                              videoPlayerController: VideoPlayerController.network(
                          //                                                  'https://chefkhalil.com/public/assets/videos/courses/${courselessonsModel.data.courses[].url}'
                          //                                              ),
                          //                                              looping: true,
                          //                                              autoplay: false,
                          //                                            ),
                          //                                          ),
                          //        ],
                          //      ),
                          //   ),
                          // );
                        }
                        // else if(snapshot.hasError){
                        //   return snapshot.error;
                        // }
                        else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .2,
                          bottom: 60),
                      child: Text(
                        '© all rights reserved to chef khalil school'.tr,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
