// import 'package:chef_khalil_application/Models/course_lessons_model.dart';
// import 'package:chef_khalil_application/Repositories/chief_repository.dart';
// import 'package:rxdart/rxdart.dart';
//
// class LessonCourseBlock{
//   final _repository = Repository();
//   final _chiefCourseFetcher = PublishSubject<CourselessonsModel>();
//
//   Stream<CourselessonsModel> get toplessonCourse=> _chiefCourseFetcher.stream;
//   getTopLessonCourses() async {
//     CourselessonsModel data = await _repository.getLessons();
//     _chiefCourseFetcher.sink.add(data);
//   }
//   dispose() {
//     _chiefCourseFetcher.close();
//   }
// }
// final bloccs = LessonCourseBlock();