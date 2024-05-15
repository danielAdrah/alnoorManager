// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:elnoor_managment/core/errors/exceptions.dart';
import 'package:elnoor_managment/pilgrims/model/pilgrim_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/api/api_consumer.dart';
import '../../core/api/end_points.dart';

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
  //===================
  List<PilgrimModel> pilgrimList = [];
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
      List<PilgrimModel> employeeList =
          jsonResponse.map((e) => PilgrimModel.fromJson(e)).toList();

      print("the len is ${employeeList.length}");
      return employeeList;
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }
}
