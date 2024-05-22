// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:elnoor_managment/core/api/api_consumer.dart';
import 'package:elnoor_managment/core/api/end_points.dart';
import 'package:elnoor_managment/core/errors/exceptions.dart';
import 'package:elnoor_managment/employees/model/indiviual_employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/add_task_model.dart';
import '../model/employee_model.dart';

class EmployeeController extends GetxController {
  //=================
  var dio = Dio(
    BaseOptions(
      baseUrl: EndPoint.baseUrl,
    ),
  );
  final GetStorage storage = GetStorage();
  //===================
  final TextEditingController taskName = TextEditingController();
  final TextEditingController taskContent = TextEditingController();
  //                     -----
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  //                    ------
  final TextEditingController updatedEmppassController =
      TextEditingController();
  final TextEditingController updatedEmpnameController =
      TextEditingController();
  final TextEditingController updatedEmpmailController =
      TextEditingController();
  final TextEditingController updatedEmpnumController = TextEditingController();
  //                   --------

  RxList<EmployeeModel> empList = <EmployeeModel>[].obs;
  Rx<IndiviualEmployeeModel?> employee = Rx<IndiviualEmployeeModel?>(null);
  AddTaskModel? newTask;
  //==========================================

  Future<List<EmployeeModel>> fetchEmployee() async {
    try {
      var token = storage.read("accessToken");
      print("the employee token is $token");
      var response = await dio.get(
        EndPoint.listEmployee,
        options: Options(headers: {ApiKeys.auth: "Bearer $token"}),
      );
      print(" the emp response is ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<EmployeeModel> employeeList =
          jsonResponse.map((e) => EmployeeModel.fromJson(e)).toList();
      print("the length is ${employeeList.length}");
      List employeeId = employeeList.map((e) => e.id).toList();
      var id;
      for (var emp in employeeList) {
        var idd = emp.id;
        id = idd;
      }

      storage.write("mm", id);
      empList.value = employeeList;
      print("the obx is ${empList[0].email}");
      return employeeList;
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

  //====================================================================
  Future<IndiviualEmployeeModel> getEmployee(int id) async {
    var token = storage.read("accessToken");
    print("token from indiviual is $token");

    try {
      IndiviualEmployeeModel? getEmployee;
      // var id = storage.read("mm");
      var response = await dio.get(
        EndPoint.getEmployee(id),
        options: Options(headers: {ApiKeys.auth: "Bearer $token"}),
      );

      print("the one employee is ${response.data}");

      getEmployee = IndiviualEmployeeModel.fromJson(response.data);
      print("the data is ${getEmployee.id}");
      employee.value = getEmployee;
      print("the obx is ${employee.value!.username}");
      // }
      return getEmployee;
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

  //====================================================================
  addTask() async {
    var token = storage.read("accessToken");
    print("the token from the task is $token");
    List empId = storage.read("empID");
    print("the empID are $empId");
    try {
      for (var id in empId) {
        String endPoint = EndPoint.addTask(id);
        var response = await dio.post(endPoint,
            data: {
              ApiKeys.title: taskName.text,
              ApiKeys.content: taskContent.text,
            },
            options: Options(
              headers: {
                ApiKeys.auth: "Bearer $token",
              },
            ));
        print("the response from the task ${response.data}");
        newTask = AddTaskModel.fromJson(response.data);
        print("something ${newTask!.content}");
      }
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

  //========================================================
  addEmployee() async {
    try {
      var token = storage.read("accessToken");
      print("token from addEmp $token");
      var response = await dio.post(EndPoint.addEmployee,
          options: Options(headers: {
            ApiKeys.auth: "Bearer $token",
          }),
          data: {
            ApiKeys.username: nameController.text,
            ApiKeys.email: mailController.text,
            ApiKeys.password: numController.text,
            ApiKeys.phonenumber: passController.text,
          });
      print("the newEmp response is ${response.data} ");
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

  //=========================================================
  updateEmployee() async {
    try {
      var token = storage.read("accessToken");
      var empId = storage.read("mm");
      print("from update ${empId}");

      var response = await dio.put(
        EndPoint.updateEmployee(empId),
        data: {
          ApiKeys.username: updatedEmpnameController.text,
          ApiKeys.phonenumber: updatedEmpnumController.text,
          ApiKeys.email: updatedEmpmailController.text,
          ApiKeys.password: updatedEmppassController.text,
        },
        options: Options(headers: {
          ApiKeys.auth: "Bearer $token",
        }),
      );
      print("response from updated is ${response.data}");
      print("token from update is $token");
    } on ServerExcption catch (e) {
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }
}
