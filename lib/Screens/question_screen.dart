import 'dart:io';

import 'package:chief_khalil/Models/course_lessons_model.dart';
import 'package:chief_khalil/Models/quiz_lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class ScreenQuestion extends StatefulWidget {
  final Coursesss args;
  const ScreenQuestion({Key key, this.args}) : super(key: key);
  @override
  _ScreenQuestionState createState() => _ScreenQuestionState();
}

class _ScreenQuestionState extends State<ScreenQuestion> {
  Future getTopquizes() async {
    var Api = Uri.parse(
        "https://chefkhalil.com/api/courses/lesson/quiz/${widget.args.id}");
    final response = await http.get(Api);
    if (response.statusCode == 200) {
      final quizModel = quizFromJson(response.body);
      return quizModel ;
    } else {
      throw Exception('Error');
    }
  }
  int _groupValue = -1;
  Future allGroupsModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('remember_token');
    final newURI = Uri.https('www.chefkhalil.com',
        '/api/auth/courses/lesson/quiz/${widget.args.id}', {'token': token});

    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    http.Response response = await http.get(newURI, headers: headers);
    if (response.statusCode == 200) {
      final quizModel = quizFromJson(response.body);
      return quizModel;
    }
    print('x');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xFF20252B),
        title: Text(
          'Question',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Image.asset(
              'assets/logo.png',
              height: 20,
              width: 50,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
     FutureBuilder(
       future: getTopquizes(),
       builder: (context,snapshot){
         if(snapshot.hasData){
           QuizModel quizModel=snapshot.data;
           return Card(
             elevation: 3,
             shape: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15)
             ),
             child: Container(
               margin: EdgeInsets.only(top: 30,left: 20,right: 20),
               width: double.infinity,
               height: MediaQuery.of(context).size.height*.7,
               child: Column(
                 children: [
                   SizedBox(
                     height: MediaQuery.of(context).size.height*.6,
                     child: ListView.builder(
                         itemCount: quizModel.data.quiz8868Data.quiz.length,
                       itemBuilder: (context,index){
                    QuizModel quizModel= snapshot.data;
                         return SafeArea(child: Column(
                           children: [
                             Container(
                               margin: EdgeInsets.only(top: 10,left: 20,right: 10),
                               child: Row(
                                 children: [
                                   Text('${quizModel.data.quiz8868Data.questions[index].questionEn} ?',style: TextStyle(
                                     color: Color(0xFF2C2525),fontSize: 18,fontWeight: FontWeight.bold
                                   ),),
                                 ],
                               ),
                             ),
                          RadioListTile(
                              activeColor: Color(0xFFFC834B),
                              selected: false,
                            title: Text('${quizModel.data.quiz8868Data.questions[index].allAnswersEn}',style: TextStyle(
                         color: Color(0xFF3F3636),fontSize: 15,fontWeight: FontWeight.normal
                         ),),
                              value: 1, groupValue: _groupValue, onChanged: (newValue){
                            setState(() => _groupValue = newValue);

                          }),
                           ],
                         ));
                       },
                     ),
                   ),
                   Align(
                     alignment: Alignment.topLeft,
                       child: RaisedButton(
                         color: Color(0xFF78BF4D),
                         child: Text('Submit',style: TextStyle(fontSize: 18,color: Colors.white),),
                           onPressed: (){}))

                 ],
               ),
             ),
           );
         }else{
           return CircularProgressIndicator();
         }
       },
     ),
            Container(
              margin: EdgeInsets.only(top: 20,bottom: 12),
              child: Text('© all rights reserved to Chef khalil-school | Developed by WE Group',style: TextStyle(fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }
}
