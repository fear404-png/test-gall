// To parse this JSON data, do
//
//     final itemsNewImages = itemsNewImagesFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

ItemsNewImages itemsNewImagesFromJson(String str) =>
    ItemsNewImages.fromJson(json.decode(str));

String itemsNewImagesToJson(ItemsNewImages data) => json.encode(data.toJson());

class ItemsNewImages {
  ItemsNewImages({
    this.totalItems,
    this.itemsPerPage,
    this.countOfPages,
    this.data,
  });

  int? totalItems;
  int? itemsPerPage;
  int? countOfPages;
  List<Datum>? data;

  factory ItemsNewImages.fromJson(Map<String, dynamic> json) => ItemsNewImages(
        totalItems: json["totalItems"],
        itemsPerPage: json["itemsPerPage"],
        countOfPages: json["countOfPages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "itemsPerPage": itemsPerPage,
        "countOfPages": countOfPages,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.dateCreate,
    this.description,
    this.datumNew,
    this.popular,
    this.image,
    this.user,
  });

  int? id;
  String? name;
  DateCreate? dateCreate;
  String? description;
  bool? datumNew;
  bool? popular;
  Image? image;
  dynamic? user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        dateCreate: dateCreateValues.map![json["dateCreate"]],
        description: json["description"],
        datumNew: json["new"],
        popular: json["popular"],
        image: Image.fromJson(json["image"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dateCreate": dateCreateValues.reverse![dateCreate],
        "description": description,
        "new": datumNew,
        "popular": popular,
        "image": image!.toJson(),
        "user": user,
      };
}

enum DateCreate { THE_00011130_T00_00000231 }

final dateCreateValues = EnumValues(
    {"-0001-11-30T00:00:00+02:31": DateCreate.THE_00011130_T00_00000231});

class Image {
  Image({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
