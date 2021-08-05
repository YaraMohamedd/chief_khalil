import 'dart:io';

import 'package:chief_khalil/Models/course_lessons_model.dart';
import 'package:chief_khalil/Models/quiz_lesson_model.dart';
import 'package:chief_khalil/Screens/main_question.dart';
import 'package:chief_khalil/Screens/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {
  final Coursesss args;
  final Quiz question;
  final int questionIndex;
  final Function answerQuestion;
  final String myString;
  const QuizScreen(
      {Key key,
      this.args,
      this.question,
      this.answerQuestion,
      this.questionIndex,
      this.myString});
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _questions = List<Quiz>();
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  // Future allGroupsModel() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString('remember_token');
  //   final newURI = Uri.https('www.chefkhalil.com',
  //       '/api/auth/courses/lesson/quiz/${widget.args.id}', {'token': token});

  //   final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  //   http.Response response = await http.get(newURI, headers: headers);
  //   if (response.statusCode == 200) {
  //     final quizModel = quizFromJson(response.body);
  //     return quizModel;
  //   }
  //   print('x');
  // }
  Future allGroupsModel() async {
    var Api = Uri.parse(
        "https://chefkhalil.com/api/courses/lesson/quiz/${widget.args.id}");
    final response = await http.get(Api);
    if (response.statusCode == 200) {
      final quizModel = quizFromJson(response.body);
      return quizModel;
    } else {
      print('x');
    }
  }

  @override
  void initState() {
    super.initState();
    allGroupsModel();
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
            '${widget.args.nameEn}',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: Image.asset(
                'assets/logo.png',
                height: 20,
                width: 50,
              ),
            )
          ],
        ),
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
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ScreenQuestion(
                                              args:
                                                  Coursesss(id: widget.args.id),
                                            )));
                              },
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
                                            widget.myString == 'en'
                                                ? Text(
                                                    '${quizModel.data.quiz8868Data.quiz[index].titleEn}',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF78BF4D),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : Text(
                                                    '${quizModel.data.quiz8868Data.quiz[index].titleAr}',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF78BF4D),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                              'Quiz Description :'.tr,
                                              style: TextStyle(
                                                  color: Color(0xFFFC834B),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            widget.myString == 'en'
                                                ? Text(
                                                    '${quizModel.data.quiz8868Data.quiz[index].descriptionEn}',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF78BF4D),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : Text(
                                                    '${quizModel.data.quiz8868Data.quiz[index].descriptionAr}',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF78BF4D),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
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
      ),
    );
  }
}
