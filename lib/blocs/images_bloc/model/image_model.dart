import 'dart:convert';

ItemImage itemImageFromJson(String str) => ItemImage.fromJson(json.decode(str));

String itemImageToJson(ItemImage data) => json.encode(data.toJson());

class ItemImage {
  String? file;
  String? name;
  int? id;

  ItemImage({
    this.file,
    this.name,
    this.id,
  });

  factory ItemImage.fromJson(Map<String, dynamic> json) => ItemImage(
        file: json["file"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
        "name": name,
        "id": id,
      };
}
