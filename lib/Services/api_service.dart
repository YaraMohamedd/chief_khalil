import 'dart:convert';

import 'package:chief_khalil/Models/cheif_model.dart';
import 'package:chief_khalil/Models/chief_course_model.dart';
import 'package:http/http.dart'as http;


class CheifService {
  Future<Cheif> getTopChiefs () async {
   var Api=Uri.parse("https://chefkhalil.com/api/chiefs");
    final response = await http.get(Api);
    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      return Cheif.fromJson(json);
    }
    else {
      throw Exception('Error');
    }
  }
  Future<Course> getTopChiefCourse () async {
    var Api=Uri.parse("https://chefkhalil.com/api/courses");
    final response = await http.get(Api);
    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      return Course.fromJson(json);
    }
    else {
      throw Exception('Error');
    }
  }


// static Future<Map<String,dynamic>> getCheifs() async {
  //   var API=Uri.parse("https://chefkhalil.com/api/chiefs");
  //   try {
  //     final response =
  //     await http.get(API);
  //     if (response.statusCode == 200) {
  //       return json.decode(response.body);
  //     } else {
  //       throw Exception("Error");
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  // Future<Map<String, dynamic>> fetch() async {
  //   var API=Uri.parse("https://chefkhalil.com/api/chiefs");
  //   final response = await http.get(API);
  //   if (response.statusCode != 200) return null;
  //   return json.decode(response.body);
  // }

  // static List<Chiefs> parseCheifs(String responseBody) {
  //   final parsed = json.decode(responseBody).Map<String, dynamic>();
  //   return parsed.map<Chiefs>((json) => Chiefs.fromJson(json)).toList();
 //  // }
 // static List<Chiefs> parseJson(String response) {
 //    List<Chiefs> chiefs = new List<Chiefs>();
 //    Map<String,dynamic> jsonParsed = json.decode(response.toString());
 //    for (int i = 0; i < jsonParsed.length; i++) {
 //      chiefs.add(new Chiefs.fromJson(jsonParsed[i]));
 //    }
 //    return chiefs;
 //  }

}