

import 'dart:convert';

QuizModel quizFromJson(String str) => QuizModel.fromJson(json.decode(str));

String quizToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
  QuizModel({
    this.status,
    this.msg,
    this.data,
  });

  bool status;
  Msg msg;
  Data data;

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    status: json["status"],
    msg: Msg.fromJson(json["msg"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg.toJson(),
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.quiz8868Data,
  });

  Quiz8868Data quiz8868Data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    quiz8868Data: Quiz8868Data.fromJson(json["quiz8868data"]),
  );

  Map<String, dynamic> toJson() => {
    "quiz8868data": quiz8868Data.toJson(),
  };
}

class Quiz8868Data {
  Quiz8868Data({
    this.quiz,
    this.questions,
  });

  List<Quiz> quiz;
  List<dynamic> questions;

  factory Quiz8868Data.fromJson(Map<String, dynamic> json) => Quiz8868Data(
    quiz: List<Quiz>.from(json["quiz"].map((x) => Quiz.fromJson(x))),
    questions: List<dynamic>.from(json["questions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "quiz": List<dynamic>.from(quiz.map((x) => x.toJson())),
    "questions": List<dynamic>.from(questions.map((x) => x)),
  };
}

class Quiz {
  Quiz({
    this.id,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.numberOfQuestions,
    this.totalScore,
    this.coursesLessonsId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String titleAr;
  String titleEn;
  String descriptionAr;
  String descriptionEn;
  String numberOfQuestions;
  String totalScore;
  String coursesLessonsId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
    id: json["id"],
    titleAr: json["title_ar"],
    titleEn: json["title_en"],
    descriptionAr: json["description_ar"],
    descriptionEn: json["description_en"],
    numberOfQuestions: json["number_of_questions"],
    totalScore: json["total_score"],
    coursesLessonsId: json["courses_lessons_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title_ar": titleAr,
    "title_en": titleEn,
    "description_ar": descriptionAr,
    "description_en": descriptionEn,
    "number_of_questions": numberOfQuestions,
    "total_score": totalScore,
    "courses_lessons_id": coursesLessonsId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Msg {
  Msg({
    this.quizId,
    this.questionsNumber,
  });

  int quizId;
  int questionsNumber;

  factory Msg.fromJson(Map<String, dynamic> json) => Msg(
    quizId: json["quiz_id"],
    questionsNumber: json["questions_number"],
  );

  Map<String, dynamic> toJson() => {
    "quiz_id": quizId,
    "questions_number": questionsNumber,
  };
}
