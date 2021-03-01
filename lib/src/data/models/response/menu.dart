import 'dart:convert';

Menu menuFromMap(String str) => Menu.fromMap(json.decode(str));

String menuToMap(Menu data) => json.encode(data.toMap());

class Menu {
  Menu({
    this.id,
    this.name,
    this.img,
    this.listData,
  });

  int id;
  String name;
  String img;
  String listData;

  factory Menu.fromMap(Map<String, dynamic> json) => Menu(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        listData: json["listData"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "img": img,
        "listData": listData,
      };
}
