import 'package:dio/dio.dart';
import 'package:elnoor_managment/core/api/api_consumer.dart';
import 'package:elnoor_managment/core/errors/exceptions.dart';
import 'package:elnoor_managment/notification_/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/api/end_points.dart';
import '../../log_in/model/user_state.dart';
import '../model/send_succesfully_model.dart';

class NotificationController extends GetxController {
  var dio = Dio(
    BaseOptions(
      baseUrl: EndPoint.baseUrl,
    ),
  );
  final GetStorage storage = GetStorage();
  UserState userState = UserInitial();
  //==================================
  final TextEditingController notiName = TextEditingController();
  final TextEditingController notiContent = TextEditingController();
  //=================================
  NotificationDone? done;
  RxBool isSendDone = false.obs;
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
      isSendDone.value = true;
      // print("siiii ${done!.message}");
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }
  //===================================================
  // showBox() {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(''),
  //         content: Text('تم إرسال الإشعار بنجاح'),
  //         actions: [
  //           TextButton(
  //             child: Text('حسنا'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               // Reset the flag
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  //====================================================
  Future<List<NotificationModel>> showNotification() async {
    try {
      var token = storage.read("accessToken");
      print("token from noti $token");
      var response = await dio.get(EndPoint.listNotification,
          options: Options(headers: {
            ApiKeys.auth: "Beaer $token",
          }));
      print("the notification list is ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<NotificationModel> notiList =
          jsonResponse.map((e) => NotificationModel.fromJson(e)).toList();
      print("llllllllllll ${notiList.length}");

      return notiList;
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }
}
