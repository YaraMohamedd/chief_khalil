// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LiveStream liveFromJson(String str) => LiveStream.fromJson(json.decode(str));

String liveToJson(LiveStream data) => json.encode(data.toJson());

class LiveStream {
  LiveStream({
    this.status,
    this.msg,
    this.data,
  });

  bool status;
  String msg;
  Data data;

  factory LiveStream.fromJson(Map<String, dynamic> json) => LiveStream(
    status: json["status"],
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.streams,
  });

  Streams streams;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    streams: Streams.fromJson(json["streams"]),
  );

  Map<String, dynamic> toJson() => {
    "streams": streams.toJson(),
  };
}

class Streams {
  Streams({
    this.todayStreams,
    this.comingStreams,
    this.finishedStreams,
  });

  List<Stream> todayStreams;
  List<dynamic> comingStreams;
  List<Stream> finishedStreams;

  factory Streams.fromJson(Map<String, dynamic> json) => Streams(
    todayStreams: List<Stream>.from(json["todayStreams"].map((x) => Stream.fromJson(x))),
    comingStreams: List<dynamic>.from(json["comingStreams"].map((x) => x)),
    finishedStreams: List<Stream>.from(json["finishedStreams"].map((x) => Stream.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "todayStreams": List<dynamic>.from(todayStreams.map((x) => x.toJson())),
    "comingStreams": List<dynamic>.from(comingStreams.map((x) => x)),
    "finishedStreams": List<dynamic>.from(finishedStreams.map((x) => x.toJson())),
  };
}

class Stream {
  Stream({
    this.id,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.startDate,
    this.url,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.categoryNameAr,
    this.categoryNameEn,
  });

  int id;
  String titleAr;
  String titleEn;
  String descriptionAr;
  String descriptionEn;
  DateTime startDate;
  String url;
  String categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  String categoryNameAr;
  String categoryNameEn;

  factory Stream.fromJson(Map<String, dynamic> json) => Stream(
    id: json["id"],
    titleAr: json["title_ar"],
    titleEn: json["title_en"],
    descriptionAr: json["description_ar"],
    descriptionEn: json["description_en"],
    startDate: DateTime.parse(json["start_date"]),
    url: json["url"],
    categoryId: json["category_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categoryNameAr: json["category_name_ar"],
    categoryNameEn: json["category_name_en"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title_ar": titleAr,
    "title_en": titleEn,
    "description_ar": descriptionAr,
    "description_en": descriptionEn,
    "start_date": startDate.toIso8601String(),
    "url": url,
    "category_id": categoryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "category_name_ar": categoryNameAr,
    "category_name_en": categoryNameEn,
  };
}
