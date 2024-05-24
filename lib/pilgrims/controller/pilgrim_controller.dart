// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:elnoor_managment/core/errors/exceptions.dart';
import 'package:elnoor_managment/pilgrims/model/pilgrim_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/api/api_consumer.dart';
import '../../core/api/end_points.dart';
import '../model/guides_model.dart';
import '../model/indiviual_pilgrim._model.dart';

class PilgrimController extends GetxController {
  ApiConsumer api;
  PilgrimController({required this.api});
  //=================
  var dio = Dio(
    BaseOptions(
      baseUrl: EndPoint.baseUrl,
    ),
  );
  final GetStorage storage = GetStorage();
  //===================createPilgrim============================
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherController = TextEditingController();
  final TextEditingController grandFatherController = TextEditingController();
  final TextEditingController familyController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  final TextEditingController flightNumController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController arriveController = TextEditingController();
  final TextEditingController leaveController = TextEditingController();
  final TextEditingController boardController = TextEditingController();
  final TextEditingController gateNumController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController hotelController = TextEditingController();
  final TextEditingController hotelAddController = TextEditingController();
  final TextEditingController roomNumController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController fromCityController = TextEditingController();
  final TextEditingController toCityController = TextEditingController();
  final TextEditingController flightDateController = TextEditingController();
//=====================updatePilgrim=======================

  List<PilgrimModel> pilgrimList = [];
  Rx<IndiviualPilgrim?> onePilgrim = Rx<IndiviualPilgrim?>(null);
  RxList<GuideList> gList = <GuideList>[].obs;
  List<GuideList> listG = [];
  List listGG = [];
  //==========================================

  Future<List<PilgrimModel>> fetchPilgrims() async {
    var token = storage.read("accessToken");
    print("the pil token is $token");
    try {
      var response = await dio.get(
        EndPoint.listPilgrims,
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token",
          },
        ),
      );
      print("the pilgrim response is ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<PilgrimModel> pilgrimList =
          jsonResponse.map((e) => PilgrimModel.fromJson(e)).toList();
      var id;
      for (var pil in pilgrimList) {
        var i = pil.id;
        id = i;
      }
      storage.write("pilId", id);
      print("the len is ${pilgrimList.length}");
      return pilgrimList;
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

  //=====================================================
  Future<IndiviualPilgrim> getPilgrim(int id) async {
    try {
      var token = storage.read("accessToken");
      print("token from one pilgrim $token");
      var response = await dio.get(
        EndPoint.getPilgrim(id),
        options: Options(headers: {
          ApiKeys.auth: "Bearer $token",
        }),
      );
      print("response from one pilgrim ${response.data}");
      IndiviualPilgrim pilgrim = IndiviualPilgrim.fromJson(response.data);
      print("after parsing from onePilgrim ${pilgrim.active}");
      onePilgrim.value = pilgrim;
      return pilgrim;
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

  //==================================================
  // createPilgrim() async {
  //   try {

  //     var token = storage.read("accessToken");
  //     print("token from create pil $token");
  //     var response = await dio.post(
  //       EndPoint.createPilgrim,
  //       options: Options(
  //         headers: {
  //           ApiKeys.auth: "Bearer $token",
  //         },
  //       ),
  //       data: {
  //         "phonenumber": numController.text,
  //         "first_name": nameController.text,
  //         "father_name": fatherController.text,
  //         "grand_father": grandFatherController.text,
  //         "last_name": familyController.text,
  //         "password": passController.text,
  //         "birthday": dateController.text,
  //         "guide": 3,
  //         "registeration_id": idController.text,
  //         "boarding_time": boardController.text,
  //         "flight_num": flightNumController.text,
  //         "flight_date": flightDateController.text,
  //         "flight_company": companyController.text,
  //         "gate_num": gateNumController.text,
  //         "from_city": fromCityController.text,
  //         "to_city": toCityController.text,
  //         "arrival": arriveController.text,
  //         "departure": leaveController.text,
  //         "status": stateController.text,
  //         "hotel_address": hotelAddController.text,
  //         "hotel": hotelController.text,
  //         "room_num": roomNumController.text,
  //         "company_logo": "kk"

  //       },
  //     );
  //     // print("response from add pil ${response.data}");
  //   } on ServerExcption catch (e) {
  //     throw Exception(
  //         'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
  //   }
  // }
  Future<void> createPilgrim() async {
    try {
      var token = storage.read("accessToken");
      print("token from create pil $token");

      var url = Uri.parse("http://85.31.237.33/test/api/list-guides/");
      var response = await http.post(
        url,
        headers: {
          ApiKeys.auth: "Bearer $token",
        },
        body: jsonEncode({
          "phonenumber": numController.text,
          "first_name": nameController.text,
          "father_name": fatherController.text,
          "grand_father": grandFatherController.text,
          "last_name": familyController.text,
          "password": passController.text,
          "birthday": dateController.text,
          "guide": 3,
          "registeration_id": idController.text,
          "boarding_time": boardController.text,
          "flight_num": flightNumController.text,
          "flight_date": flightDateController.text,
          "flight_company": companyController.text,
          "gate_num": gateNumController.text,
          "from_city": fromCityController.text,
          "to_city": toCityController.text,
          "arrival": arriveController.text,
          "departure": leaveController.text,
          "status": stateController.text,
          "hotel_address": hotelAddController.text,
          "hotel": hotelController.text,
          "room_num": roomNumController.text,
          "company_logo": "",
        }),
      );

      // Optionally, parse the response if needed
      // var responseData = jsonDecode(response.body);

      print("response from add createdpil ${response.statusCode}");
    } on Exception catch (e) {
      print('Failed to load posts: ${e.toString()}');
    }
  }
  //========================================

  updatePilgrim(int id) async {
    try {
      Map<String, dynamic> requestBody = {
        "phonenumber": "+966512345623",
        "password": "rabee123@@",
        "first_name": "rfddd",
        "father_name": "wr",
        "grand_father": "erg",
        "last_name": "re",
        "guide": 6,
        "registeration_id": "23523",
        "birthday":
            "2023 -03 -03", // Ensure the date format matches your backend's expectations
        "flight_company": "test",
        "status":
            true, // Or true/false without quotes if your backend expects a boolean
        "gate_num": "23",
        "boarding_time": "02:43",
        "from_city": "SYR",
        "to_city": "KSA",
        "flight_date":
            " 2002-02-02", // Ensure the date format matches your backend's expectations
        "flight_num": "44",
        "departure": "13:15",
        "arrival": "04:00",
        "hotel_address": "rr",
        "hotel": "wefj",
        "room_num": "12",
        "company_logo": "ssss",
      };
      var token = storage.read("accessToken");
      print("token from updatePil $token");
      // var pilgrimId = storage.read("pilId");

      var response = await dio.put(
        EndPoint.updatePilgrim(id),
        options: Options(headers: {ApiKeys.auth: "Bearer $token"}),
        data: requestBody,
        // {
        //   "phonenumber": "+96651236548",
        //   "password": "rabbe@@",
        //   "first_name": "ali",
        //   "father_name": "ali",
        //   "grand_father": "ali",
        //   "last_name": "al",
        //   "guid": "2",
        //   "registeration_id": "12345",
        //   "birthday": "",
        //   "flight_company": "ss",
        //   "status": "aa",
        //   "gate_num": "5",
        //   "boarding_time": "",
        //   "from_city": "sas",
        //   "to_city": "ccc",
        //   "flight_date": "",
        //   "flight_num": "5",
        //   "departure": "",
        //   "company_logo": "ssss",
        //   "arrival": "",
        //   "hotel_address": "sd",
        //   "hotel": "qq",
        //   "room_num": "4",
        // },
      );
      print("the response from update pil ${response.data}");
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

//====================================
  Future<List<GuideList>> fetchGuide() async {
    try {
      var token = storage.read("accessToken");
      print("token from guide $token");
      var response = await dio.get(
        EndPoint.listGuides,
        options: Options(
          headers: {
            ApiKeys.auth: "Bearer $token",
          },
        ),
      );
      print("the response from guide ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<GuideList> guideList =
          jsonResponse.map((e) => GuideList.fromJson(e)).toList();
      print("after ${guideList.length}");
      gList.value = guideList;
      listGG = guideList.map((e) => e.username).toList();
      print(" here${listGG}");

      update();
      print("after all ${gList[1].username}");

      return guideList;
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

  //================================================
}
