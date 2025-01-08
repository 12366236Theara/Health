// To parse this JSON data, do
//
//     final homSlides = homSlidesFromJson(jsonString);

import 'dart:convert';

HomeModelApiInfo homSlidesFromJson(String str) => HomeModelApiInfo.fromJson(json.decode(str));

String homSlidesToJson(HomeModelApiInfo data) => json.encode(data.toJson());

class HomeModelApiInfo {
    int status;
    String message;
    HomeGritSlides data;

    HomeModelApiInfo({
        required this.status,
        required this.message,
        required this.data,
    });

    factory HomeModelApiInfo.fromJson(Map<String, dynamic> json) => HomeModelApiInfo(
        status: json["status"],
        message: json["message"],
        data: HomeGritSlides.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class HomeGritSlides {
    List<String> slides;
    String name;
    String description;
    String facebook;
    String telegram;
    String tiktok;
    String youtube;
    String email;
    List<String> phoneNumbers;

    HomeGritSlides({
        required this.slides,
        required this.name,
        required this.description,
        required this.facebook,
        required this.telegram,
        required this.tiktok,
        required this.youtube,
        required this.email,
        required this.phoneNumbers,
    });

    factory HomeGritSlides.fromJson(Map<String, dynamic> json) => HomeGritSlides(
        slides: List<String>.from(json["slides"].map((x) => x)),
        name: json["name"],
        description: json["description"],
        facebook: json["facebook"],
        telegram: json["telegram"],
        tiktok: json["tiktok"],
        youtube: json["youtube"],
        email: json["email"],
        phoneNumbers: List<String>.from(json["phoneNumbers"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "slides": List<dynamic>.from(slides.map((x) => x)),
        "name": name,
        "description": description,
        "facebook": facebook,
        "telegram": telegram,
        "tiktok": tiktok,
        "youtube": youtube,
        "email": email,
        "phoneNumbers": List<dynamic>.from(phoneNumbers.map((x) => x)),
    };
}
