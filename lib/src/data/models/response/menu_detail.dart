import 'dart:convert';

MenuDetail menuDetailFromMap(String str) => MenuDetail.fromMap(json.decode(str));

String menuDetailToMap(MenuDetail data) => json.encode(data.toMap());

class MenuDetail {
    MenuDetail({
        this.id,
        this.name,
        this.desc,
        this.img,
    });

    String id;
    String name;
    String desc;
    String img;

    factory MenuDetail.fromMap(Map<String, dynamic> json) => MenuDetail(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        img: json["img"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "img": img,
    };
}
