
import 'package:chief_khalil/Models/chief_course_model.dart';
import 'package:chief_khalil/Repositories/chief_repository.dart';
import 'package:rxdart/rxdart.dart';

class ChiefCourseBlock{
  final _repository = Repository();
  final _chiefCourseFetcher = PublishSubject<Course>();

  Stream<Course> get topChiefCourse=> _chiefCourseFetcher.stream;
  getTopChiefCourses() async {
    Course data = await _repository.getTopChiefCourses();
    _chiefCourseFetcher.sink.add(data);
  }
  dispose() {
    _chiefCourseFetcher.close();
  }
}
final blocc = ChiefCourseBlock();