
import 'dart:convert';
import 'dart:io';
import 'package:chief_khalil/Widgets/my_drawer.dart';
import 'package:http/http.dart'as http;
import 'package:chief_khalil/Models/chief_course_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseDetailsScreen extends StatefulWidget {
  final Coursess courses;
  // final CourseData data;

CourseDetailsScreen({ this.courses}) ;
  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {

  // Future<Course> getTopChiefCourse () async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString('remember_token');
  //   final newURI=Uri.https('WWW.chefkhalil.com','/api/courses/${widget.courses.id}',{'token':token} );
  //   final headers={HttpHeaders.contentTypeHeader:'application/json'};
  // //  var Api=Uri.parse("https://chefkhalil.com/api/courses/${widget.courses.id}");
  //   // Map mapData ={
  //   //   "token": token,
  //   // };
  //   // Map<String, String> get headers => {
  //   //   "Content-Type": "application/json",
  //   // "Accept": "application/json",
  //   // "Authorization": "Bearer $token",
  //   // };
  //   http.Response response=await http.get(newURI,headers: headers);
  //   if (response.statusCode == 200){
  //     final json = jsonDecode(response.body);
  //     return Course.fromJson(json);
  //   }
  //   else {
  //     throw Exception('Error');
  //   }
  // }

  Future<Course> getTopChiefCourse () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('remember_token');
    final newURI=Uri.https('www.chefkhalil.com','/api/auth/courses/4',{'token':token} );
    final headers={HttpHeaders.contentTypeHeader:'application/json'};
  //  var Api=Uri.parse("https://chefkhalil.com/api/courses/${widget.courses.id}");
    // Map mapData ={
    //   "token": token,
    // };
    // Map<String, String> get headers => {
    //   "Content-Type": "application/json",
    // "Accept": "application/json",
    // "Authorization": "Bearer $token",
    // };
    http.Response response=await http.get(newURI,headers: headers);
    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      return Course.fromJson(json);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xFF20252B),
        title: Text('Course Details ',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Image.asset('assets/logo.png',height: 20,width: 50,),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: getTopChiefCourse(),
                    builder:(context,AsyncSnapshot<Course> snapshot){
                      if(snapshot.hasData){
                        return SizedBox(
                          height: MediaQuery.of(context).size.height*.6,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index){
                              return Column(
                                children: [
                                Image.network('${snapshot.data.data.courses[index].image}')
                                ],
                              );
                            },itemCount: snapshot.data.data.courses.length,),
                        );
                      }else if (snapshot.hasError) {
                        throw Exception();
                      }
                      return Center(child: CircularProgressIndicator(backgroundColor: Color(0xFFFC834B)));
                    }
                )
              ],
            ),
      ),
    );
  }
}
