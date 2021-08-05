
import 'package:chief_khalil/Models/cheif_model.dart';
import 'package:chief_khalil/Models/chief_course_model.dart';
import 'package:chief_khalil/Services/api_service.dart';

class Repository {
  final chiefsApiProvider = CheifService();
  Future<Cheif> getTopChiefs() =>chiefsApiProvider.getTopChiefs();
  Future<Course> getTopChiefCourses() =>chiefsApiProvider.getTopChiefCourse();
 // Future<CourselessonsModel> getLessons() =>chiefsApiProvider.getTopLessons();
}
