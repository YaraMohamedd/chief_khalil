import 'package:chief_khalil/Models/quiz_lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
class LastScreen extends StatefulWidget {
  @override
  _LastScreenState createState() => _LastScreenState();
}
class _LastScreenState extends State<LastScreen> {
  String myString;
  Future allGroupsModel() async {
    var Api = Uri.parse(
        "https://chefkhalil.com/api/courses/lesson/quiz/8868");
    final response = await http.get(Api);
    if (response.statusCode == 200) {
      final quizModel = quizFromJson(response.body);
      return quizModel;
    } else {
      print('x');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: allGroupsModel(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                QuizModel quizModel = snapshot.data;
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .6,
                  child: ListView.builder(
                    itemCount: quizModel.data.quiz8868Data.quiz.length,
                    itemBuilder: (context, index) {
                      return SafeArea(
                        child: Padding(
                          padding:EdgeInsets.all(8.0),
                          child: GestureDetector(
                            // onTap: () {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => ScreenQuestion(
                            //             args:
                            //             Coursesss(id: widget.args.id),
                            //           )));
                            // },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                margin: EdgeInsets.only(top: 30),
                                width: double.infinity,
                                height:
                                MediaQuery.of(context).size.height * .3,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left:
                                      MediaQuery.of(context).size.width *
                                          .2),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Quiz name :'.tr,
                                            style: TextStyle(
                                                color: Color(0xFFFC834B),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          // widget.myString == 'en'
                                          //     ? Text(
                                          //   '${quizModel.data.quiz8868Data.quiz[index].titleEn}',
                                          //   style: TextStyle(
                                          //       color:
                                          //       Color(0xFF78BF4D),
                                          //       fontSize: 14,
                                          //       fontWeight:
                                          //       FontWeight.bold),
                                          // )
                                          //     : Text(
                                          //   '${quizModel.data.quiz8868Data.quiz[index].titleAr}',
                                          //   style: TextStyle(
                                          //       color:
                                          //       Color(0xFF78BF4D),
                                          //       fontSize: 14,
                                          //       fontWeight:
                                          //       FontWeight.bold),
                                          // ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Quiz Description :'.tr,
                                            style: TextStyle(
                                                color: Color(0xFFFC834B),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),

                                          // widget.myString == 'en'
                                          //     ? Text(
                                          //   '${quizModel.data.quiz8868Data.quiz[index].descriptionEn}',
                                          //   style: TextStyle(
                                          //       color:
                                          //       Color(0xFF78BF4D),
                                          //       fontSize: 14,
                                          //       fontWeight:
                                          //       FontWeight.bold),
                                          // )
                                          //     : Text(
                                          //   '${quizModel.data.quiz8868Data.quiz[index].descriptionAr}',
                                          //   style: TextStyle(
                                          //       color:
                                          //       Color(0xFF78BF4D),
                                          //       fontSize: 14,
                                          //       fontWeight:
                                          //       FontWeight.bold),
                                          // ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Number Of questions:'.tr,
                                            style: TextStyle(
                                                color: Color(0xFFFC834B),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${quizModel.data.quiz8868Data.quiz[index].numberOfQuestions}',
                                            style: TextStyle(
                                                color: Color(0xFF78BF4D),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Total score:'.tr,
                                            style: TextStyle(
                                                color: Color(0xFFFC834B),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${quizModel.data.quiz8868Data.quiz[index].totalScore}',
                                            style: TextStyle(
                                                color: Color(0xFF78BF4D),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                print(snapshot.data);
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

