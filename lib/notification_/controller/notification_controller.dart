import 'package:dio/dio.dart';
import 'package:elnoor_managment/core/api/api_consumer.dart';
import 'package:elnoor_managment/core/errors/exceptions.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/api/end_points.dart';

class NotificationController extends GetxController {
  var dio = Dio(
    BaseOptions(
      baseUrl: EndPoint.baseUrl,
    ),
  );
  final GetStorage storage = GetStorage();
  //==================================
  final TextEditingController notiName = TextEditingController();
  final TextEditingController notiContent = TextEditingController();
  //=================================

  sendNotification() async {
    var token = storage.read("accessToken");
    try {
      var response = await dio.post(EndPoint.addNotification,
          data: {
            ApiKeys.title: notiName.text,
            ApiKeys.content: notiContent.text,
          },
          options: Options(headers: {
            ApiKeys.auth: "Bearer $token",
          }));
      print("the response from noti is ${response.data}");
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }
}
