// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeModel> employeeModelFromJson(String str) => List<EmployeeModel>.from(json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel {
    int id;
    int user;
    String phonenumber;
    String username;
    String email;
    String image;

    EmployeeModel({
        required this.id,
        required this.user,
        required this.phonenumber,
        required this.username,
        required this.email,
        required this.image,
    });

    factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        user: json["user"],
        phonenumber: json["phonenumber"],
        username: json["username"],
        email: json["email"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "phonenumber": phonenumber,
        "username": username,
        "email": email,
        "image": image,
    };
}
