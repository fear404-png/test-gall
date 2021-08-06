import 'dart:convert';

ResponceError responceErrorFromJson(String str) =>
    ResponceError.fromJson(json.decode(str));

String responceErrorToJson(ResponceError data) => json.encode(data.toJson());

class ResponceError {
  ResponceError({
    required this.type,
    required this.title,
    required this.detail,
  });

  String type;
  String title;
  String detail;

  factory ResponceError.fromJson(Map<String, dynamic> json) => ResponceError(
      type: json["type"], title: json["title"], detail: json["detail"]);

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "detail": detail,
      };
}

class Violation {
  Violation({
    required this.propertyPath,
    required this.message,
  });

  String propertyPath;
  String message;

  factory Violation.fromJson(Map<String, dynamic> json) => Violation(
        propertyPath: json["propertyPath"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "propertyPath": propertyPath,
        "message": message,
      };
}
