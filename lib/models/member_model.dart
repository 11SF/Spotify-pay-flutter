// To parse this JSON data, do
//
//     final member = memberFromJson(jsonString);

// import 'dart:convert';

// Member memberFromJson(String str) => Member.fromJson(json.decode(str));

// String memberToJson(Member data) => json.encode(data.toJson());

class Member {
  Member({
    required this.countMonth,
    required this.id,
    required this.name,
    required this.lastDate,
    required this.expireDate,
    required this.imgSrc,
    required this.v,
  });

  int countMonth;
  String id;
  String name;
  String lastDate;
  String expireDate;
  String imgSrc;
  int v;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        countMonth: json["countMonth"] == null ? null : json["countMonth"],
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        lastDate: json["lastDate"] == null ? null : json["lastDate"],
        expireDate: json["expireDate"] == null ? null : json["expireDate"],
        imgSrc: json["img_src"] == null ? null : json["img_src"],
        v: json["__v"] == null ? null : json["__v"],
      );

  @override
  String toString() {
    return '{ ${this.id},${this.name},${this.lastDate},${this.expireDate},${this.imgSrc},${this.countMonth}}';
  }
  // Map<String, dynamic> toJson() => {
  //       "countMonth": countMonth == null ? null : countMonth,
  //       "_id": id == null ? null : id,
  //       "name": name == null ? null : name,
  //       "lastDate": lastDate == null ? null : lastDate,
  //       "expireDate": expireDate == null ? null : expireDate,
  //       "img_src": imgSrc == null ? null : imgSrc,
  //       "__v": v == null ? null : v,
  //     };
}
