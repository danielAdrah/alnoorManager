// To parse this JSON data, do
//
//     final indiviualPilgrim = indiviualPilgrimFromJson(jsonString);

import 'dart:convert';

IndiviualPilgrim indiviualPilgrimFromJson(String str) => IndiviualPilgrim.fromJson(json.decode(str));

String indiviualPilgrimToJson(IndiviualPilgrim data) => json.encode(data.toJson());

class IndiviualPilgrim {
    int id;
    String phonenumber;
    int guideChat;
    int managerChat;
    String duration;
    String image;
    bool active;
    dynamic guide;
    String registerationId;
    String firstName;
    String fatherName;
    String grandFather;
    String lastName;
    DateTime birthday;
    int flightNum;
    DateTime flightDate;
    String arrival;
    String departure;
    String fromCity;
    String toCity;
    String boardingTime;
    int gateNum;
    String flightCompany;
    String companyLogo;
    bool status;
    String hotel;
    String hotelAddress;
    int roomNum;
    bool activeNow;
    DateTime created;
    int user;
    List<int> hajSteps;

    IndiviualPilgrim({
        required this.id,
        required this.phonenumber,
        required this.guideChat,
        required this.managerChat,
        required this.duration,
        required this.image,
        required this.active,
        required this.guide,
        required this.registerationId,
        required this.firstName,
        required this.fatherName,
        required this.grandFather,
        required this.lastName,
        required this.birthday,
        required this.flightNum,
        required this.flightDate,
        required this.arrival,
        required this.departure,
        required this.fromCity,
        required this.toCity,
        required this.boardingTime,
        required this.gateNum,
        required this.flightCompany,
        required this.companyLogo,
        required this.status,
        required this.hotel,
        required this.hotelAddress,
        required this.roomNum,
        required this.activeNow,
        required this.created,
        required this.user,
        required this.hajSteps,
    });

    factory IndiviualPilgrim.fromJson(Map<String, dynamic> json) => IndiviualPilgrim(
        id: json["id"],
        phonenumber: json["phonenumber"],
        guideChat: json["guide_chat"],
        managerChat: json["manager_chat"],
        duration: json["duration"],
        image: json["image"],
        active: json["active"],
        guide: json["guide"],
        registerationId: json["registeration_id"],
        firstName: json["first_name"],
        fatherName: json["father_name"],
        grandFather: json["grand_father"],
        lastName: json["last_name"],
        birthday: DateTime.parse(json["birthday"]),
        flightNum: json["flight_num"],
        flightDate: DateTime.parse(json["flight_date"]),
        arrival: json["arrival"],
        departure: json["departure"],
        fromCity: json["from_city"],
        toCity: json["to_city"],
        boardingTime: json["boarding_time"],
        gateNum: json["gate_num"],
        flightCompany: json["flight_company"],
        companyLogo: json["company_logo"],
        status: json["status"],
        hotel: json["hotel"],
        hotelAddress: json["hotel_address"],
        roomNum: json["room_num"],
        activeNow: json["active_now"],
        created: DateTime.parse(json["created"]),
        user: json["user"],
        hajSteps: List<int>.from(json["haj_steps"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phonenumber": phonenumber,
        "guide_chat": guideChat,
        "manager_chat": managerChat,
        "duration": duration,
        "image": image,
        "active": active,
        "guide": guide,
        "registeration_id": registerationId,
        "first_name": firstName,
        "father_name": fatherName,
        "grand_father": grandFather,
        "last_name": lastName,
        "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "flight_num": flightNum,
        "flight_date": "${flightDate.year.toString().padLeft(4, '0')}-${flightDate.month.toString().padLeft(2, '0')}-${flightDate.day.toString().padLeft(2, '0')}",
        "arrival": arrival,
        "departure": departure,
        "from_city": fromCity,
        "to_city": toCity,
        "boarding_time": boardingTime,
        "gate_num": gateNum,
        "flight_company": flightCompany,
        "company_logo": companyLogo,
        "status": status,
        "hotel": hotel,
        "hotel_address": hotelAddress,
        "room_num": roomNum,
        "active_now": activeNow,
        "created": created.toIso8601String(),
        "user": user,
        "haj_steps": List<dynamic>.from(hajSteps.map((x) => x)),
    };
}
