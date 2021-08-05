import 'dart:convert';
import 'dart:io';
import 'package:chief_khalil/Blocs/course_lesson_bloc.dart';
import 'package:chief_khalil/Models/course_lessons_model.dart';
import 'package:chief_khalil/Models/one_course_details.dart';
import 'package:chief_khalil/Screens/vedio_item.dart';
import 'package:chief_khalil/Screens/quiz_screen.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class CourseLessonScreen extends StatefulWidget {
  final Courses course;
  final String myString;

  const CourseLessonScreen({this.course, this.myString});
  @override
  _CourseLessonScreenState createState() => _CourseLessonScreenState();
}

class _CourseLessonScreenState extends State<CourseLessonScreen> {
  VideoPlayerController _controller;
  // Future allGroupsModel() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString('remember_token');
  //   final newURI = Uri.https('www.chefkhalil.com',
  //       '/api/auth/courses/lessons/${widget.course.id}', {'token': token});
  //   final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  //   http.Response response = await http.get(newURI, headers: headers);
  //   if (response.statusCode == 200) {
  //     final coursesModel = courseModelFromJson(response.body);
  //     return coursesModel;
  //   }
  // }
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
    getTopChiefCourse();
    //  allGroupsModel();
  }

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
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

        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: getTopChiefCourse(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    CourselessonsModel courselessonsModel = snapshot.data;
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .6,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              child: Column(
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
                                            courselessonsModel.data.courses[index].url == 0
                                                ? Expanded(
                                                    child: Container(
                                                      height: 200,
                                                      child: Image.network(
                                                        'https://img.icons8.com/ios/452/no-video--v2.png',
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                : Expanded(
                                                    child: Container(
                                                      height: 200,
                                                      child: VideoItems(
                                                        videoPlayerController:
                                                            VideoPlayerController
                                                                .network(
                                                                    'https://chefkhalil.com/public/assets/videos/courses/${courselessonsModel.data.courses[index].url}'),
                                                        looping: true,
                                                        autoplay: false,
                                                      ),
                                                    ),
                                                  ),
                                            Expanded(
                                              child: Container(
                                                height: 500,
                                                child: ExpansionTileCard(
                                                  key: cardA,
                                                  title: Text(
                                                    '${courselessonsModel.data.courses[index].nameEn}' +
                                                        '\t \t' +
                                                        'Playlist',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),

                                                  //  trailing: Icon(Icons.keyboard_arrow_up_rounded,color: Colors.white,),
                                                  expandedColor:
                                                      Color(0xFF202020),
                                                  baseColor: Color(0xFF2F2F2F),
                                                  children: [
                                                    SizedBox(
                                                        child: ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount:
                                                              courselessonsModel
                                                                  .data
                                                                  .courses
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return SafeArea(
                                                              child: Column(
                                                                children: [
                                                                  ListTile(
                                                                    leading: courselessonsModel.data.courses[index].image ==
                                                                            0
                                                                        ? Container(
                                                                            child:
                                                                                Image.network(
                                                                              'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=615&q=80',
                                                                              fit: BoxFit.cover,
                                                                              width: 60,
                                                                              height: 50,
                                                                            ),
                                                                          )
                                                                        : Container(
                                                                            child:
                                                                                Image.network(
                                                                              'https://chefkhalil.com/public/assets/images/courses/${courselessonsModel.data.courses[index].image}',
                                                                              width: 60,
                                                                              height: 50,
                                                                            ),
                                                                          ),
                                                                    title: Text(
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
                                                                                FontWeight.normal)),

                                                                    // leading:Image.network( 'https://chefkhalil.com/public/assets/images/courses/${snapshot.data.data.courses[index].image}') ,
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            .9)
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  child: Text(
                                                    'QUIZ To Get Certificate',
                                                    style: TextStyle(
                                                      color: Color(0xFFFC834B),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              QuizScreen(
                                                            myString:
                                                                widget.myString,
                                                            args: Coursesss(
                                                                id: courselessonsModel
                                                                    .data
                                                                    .courses[
                                                                        index]
                                                                    .id,
                                                                nameEn: courselessonsModel
                                                                    .data
                                                                    .courses[
                                                                        index]
                                                                    .nameEn),
                                                          ),
                                                        ));
                                                  },
                                                ),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.white,
                                                  size: 20,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 2,
                                      color: Color(0xFFFAFAFA).withOpacity(.9),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .3,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${courselessonsModel.data.courses[index].nameEn}' +
                                                      '-' +
                                                      '\t ' +
                                                      'lesson' +
                                                      '\t' +
                                                      '${courselessonsModel.data.courses[index].lessonNumber}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Divider(
                                                thickness: 1,
                                              ),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  '${courselessonsModel.data.courses[index].detailsEn}'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )

                                  //     Image.network('https://chefkhalil.com/public/assets/images/courses/${courselessonsModel.data.courses[index].image}')
                                ],
                              ),
                            );
                          },
                          itemCount: courselessonsModel.data.courses.length),
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Download Certificate',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        color: Color(0xFFFC834B),
                        onPressed: () {
                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>CourseLessonScreen()));
                        })),
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height * .86,
              //   width: double.infinity,
              //   margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              //   child: Card(
              //     elevation: 4,
              //     child: Column(
              //       children: [
              //         Container(
              //           margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              //           child: Row(
              //             children: [
              //               Text(
              //                 '5 Comments in this Topic:',
              //                 style: TextStyle(
              //                     fontSize: 14, fontWeight: FontWeight.bold),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Container(
              //           margin: EdgeInsets.only(top: 20, left: 20),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               CircleAvatar(
              //                 radius: 30,
              //                 backgroundImage: AssetImage(
              //                   'assets/wonderlane.jpg',
              //                 ),
              //               ),
              //               Container(
              //                 margin: EdgeInsets.only(left: 20),
              //                 // height: double.infinity,
              //                 // width: double.infinity,
              //                 child: Column(
              //                   children: [
              //                     Text(
              //                       'Etta Francis',
              //                       style: TextStyle(
              //                           color: Color(0xFF484848), fontSize: 12),
              //                     ),
              //                     Text(
              //                       '19 Jan. 18',
              //                       style: TextStyle(
              //                           color: Color(0xFF78BF4D), fontSize: 11),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               margin: EdgeInsets.only(
              //                 left: 50,
              //               ),
              //               child: ListTile(
              //                 title: Text(
              //                   'Etiam pharetra massa auctor, accumsan arcu ut, placerat ipsum. Nunc vitae tincidunt lorem. Fusce condimentum.',
              //                   style: TextStyle(
              //                       fontSize: 12, color: Colors.black),
              //                 ),
              //               ),
              //             ),
              //             Container(
              //                 margin: EdgeInsets.only(
              //                   left: 80,
              //                 ),
              //                 child: SvgPicture.asset(
              //                   'icons/iconfinder_icons_Message_1564513.svg',
              //                   width: 20,
              //                   color: Color(0xFFFC834B),
              //                 ))
              //           ],
              //         ),
              //         Container(
              //           margin: EdgeInsets.only(top: 10, left: 20),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               CircleAvatar(
              //                 radius: 30,
              //                 backgroundImage: AssetImage(
              //                   'assets/wonderlane.jpg',
              //                 ),
              //               ),
              //               Container(
              //                 margin: EdgeInsets.only(left: 20),
              //                 // height: double.infinity,
              //                 // width: double.infinity,
              //                 child: Column(
              //                   children: [
              //                     Text(
              //                       'Etta Francis',
              //                       style: TextStyle(
              //                           color: Color(0xFF484848), fontSize: 12),
              //                     ),
              //                     Text(
              //                       '19 Jan. 18',
              //                       style: TextStyle(
              //                           color: Color(0xFF78BF4D), fontSize: 11),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               margin: EdgeInsets.only(
              //                 left: 50,
              //               ),
              //               child: ListTile(
              //                 title: Text(
              //                   'Etiam pharetra massa auctor, accumsan arcu ut, placerat ipsum. Nunc vitae tincidunt lorem. Fusce condimentum.',
              //                   style: TextStyle(
              //                       fontSize: 12, color: Colors.black),
              //                 ),
              //               ),
              //             ),
              //             Container(
              //                 margin: EdgeInsets.only(
              //                   left: 80,
              //                 ),
              //                 child: SvgPicture.asset(
              //                   'icons/iconfinder_icons_Message_1564513.svg',
              //                   width: 20,
              //                   color: Color(0xFFFC834B),
              //                 ))
              //           ],
              //         ),
              //         Container(
              //           margin: EdgeInsets.only(top: 10, left: 20),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               CircleAvatar(
              //                 radius: 30,
              //                 backgroundImage: AssetImage(
              //                   'assets/wonderlane.jpg',
              //                 ),
              //               ),
              //               Container(
              //                 margin: EdgeInsets.only(left: 20),
              //                 // height: double.infinity,
              //                 // width: double.infinity,
              //                 child: Column(
              //                   children: [
              //                     Text(
              //                       'Etta Francis',
              //                       style: TextStyle(
              //                           color: Color(0xFF484848), fontSize: 12),
              //                     ),
              //                     Text(
              //                       '19 Jan. 18',
              //                       style: TextStyle(
              //                           color: Color(0xFF78BF4D), fontSize: 11),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               margin: EdgeInsets.only(
              //                 left: 50,
              //               ),
              //               child: ListTile(
              //                 title: Text(
              //                   'Etiam pharetra massa auctor, accumsan arcu ut, placerat ipsum. Nunc vitae tincidunt lorem. Fusce condimentum.',
              //                   style: TextStyle(
              //                       fontSize: 12, color: Colors.black),
              //                 ),
              //               ),
              //             ),
              //             Container(
              //                 margin: EdgeInsets.only(
              //                   left: 80,
              //                 ),
              //                 child: SvgPicture.asset(
              //                   'icons/iconfinder_icons_Message_1564513.svg',
              //                   width: 20,
              //                   color: Color(0xFFFC834B),
              //                 ))
              //           ],
              //         ),
              //         Container(
              //           margin: EdgeInsets.only(top: 10, left: 20),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               CircleAvatar(
              //                 radius: 30,
              //                 backgroundImage: AssetImage(
              //                   'assets/wonderlane.jpg',
              //                 ),
              //               ),
              //               Container(
              //                 margin: EdgeInsets.only(left: 20),
              //                 // height: double.infinity,
              //                 // width: double.infinity,
              //                 child: Column(
              //                   children: [
              //                     Text(
              //                       'Etta Francis',
              //                       style: TextStyle(
              //                           color: Color(0xFF484848), fontSize: 12),
              //                     ),
              //                     Text(
              //                       '19 Jan. 18',
              //                       style: TextStyle(
              //                           color: Color(0xFF78BF4D), fontSize: 11),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               margin: EdgeInsets.only(
              //                 left: 50,
              //               ),
              //               child: ListTile(
              //                 title: Text(
              //                   'Etiam pharetra massa auctor, accumsan arcu ut, placerat ipsum. Nunc vitae tincidunt lorem. Fusce condimentum.',
              //                   style: TextStyle(
              //                       fontSize: 12, color: Colors.black),
              //                 ),
              //               ),
              //             ),
              //             Container(
              //                 margin: EdgeInsets.only(
              //                   left: 80,
              //                 ),
              //                 child: SvgPicture.asset(
              //                   'icons/iconfinder_icons_Message_1564513.svg',
              //                   width: 20,
              //                   color: Color(0xFFFC834B),
              //                 ))
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 20, left: 30, right: 20),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Write Feedback Now:',
              //         style:
              //             TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   width: double.infinity,
              //   height: 100,
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       border: Border.all(color: Colors.grey.withOpacity(.3))),
              //   margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         hintText: 'Your Comment......',
              //         hintStyle:
              //             TextStyle(color: Color(0xFF7C7C7C), fontSize: 12),
              //         border: OutlineInputBorder(borderSide: BorderSide.none)),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 12),
                child: Text(
                  '© all rights reserved to chef khalil school'.tr,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
        // body: Column(
        //   children: [
        //     VideoItems(
        //       videoPlayerController: VideoPlayerController.network(
        //         'https://chefkhalil.com/public/assets/images/courses/',
        //       ),
        //       looping: true,
        //       autoplay: true,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
