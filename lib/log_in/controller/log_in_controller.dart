// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:elnoor_managment/core/errors/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/api/api_consumer.dart';
import '../../core/api/end_points.dart';
import '../model/log_in_model.dart';
import '../model/user_state.dart';

class LogInController extends GetxController {
  ApiConsumer api;
  LogInController({required this.api});
  final GetStorage storage = GetStorage();
  UserState userState = UserInitial();
  LogInModel? logInUser;
  bool isLoading = false;
  //========================================
  var dio = Dio(
    BaseOptions(
      baseUrl: EndPoint.baseUrl,
    ),
  );
  //=======================================
  final TextEditingController passController = TextEditingController();
  final TextEditingController numController = TextEditingController();

//============================================================
  logIn() async {
    try {
      userState = LogInLoading();
      update();
      isLoading = true;
      update();

      final response = await api.post(EndPoint.logIn, data: {
        ApiKeys.username: numController.text,
        ApiKeys.password: passController.text,
        ApiKeys.deviceId:
            "sdsdsdsdsdsdshkjhjjhjhjhjhjhjhjkjkjkjkjkjkkkkffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeeeeeeeeeeekkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkdd",
      });
      print("before");
      print("the login response is $response");
      logInUser = LogInModel.fromJson(response);
      final accessToken = logInUser!.tokens.access;
      final refreshToken = logInUser!.tokens.refresh;
      final userId = logInUser!.userId;
      final user_name = logInUser!.fullName;
      storage.write("accessToken", accessToken);
      storage.write("refreshToken", refreshToken);
      storage.write("userId", userId);
      storage.write("userName", user_name);
      isLoading = false;
      update();
      userState = LogInSuccess();
      update();
      await Future.delayed(Duration(seconds: 2));

      print("the $refreshToken");
    } on ServerExcption catch (e) {
      userState =
          LogInFailure(errMessage: e.errModel.nonFieldErrors.toString());
      update();
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    } finally {}
  }
}
