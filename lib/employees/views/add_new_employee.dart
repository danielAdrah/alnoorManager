// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:elnoor_managment/comon_widgets/custom_text_field.dart';
import 'package:elnoor_managment/comon_widgets/primary_button.dart';
import 'package:elnoor_managment/employees/controller/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/number_text_field.dart';
import '../../comon_widgets/password_custome_text_field.dart';
import '../../theme.dart';

class AddNewEmployee extends StatefulWidget {
  const AddNewEmployee({super.key});

  @override
  State<AddNewEmployee> createState() => _AddNewEmployeeState();
}

class _AddNewEmployeeState extends State<AddNewEmployee> {
  final controller = Get.put(EmployeeController());
  clearText() {
    controller.nameController.clear();
    controller.numController.clear();
    controller.passController.clear();
    controller.mailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: FadeInDown(
            delay: Duration(milliseconds: 700),
            child: const Text('إضافة موظف ')),
        centerTitle: true,
        actions: [
          FadeInRight(
            delay: Duration(milliseconds: 500),
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Image.asset(
                  "assets/img/whiteArr.png",
                  color: TColor.black,
                )),
          )
        ],
      ),
      body: GetBuilder<EmployeeController>(
          init: EmployeeController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  FadeInLeft(
                    delay: Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: media.width * 0.05),
                          child: const Text("  الاسم"),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                            txtController: controller.nameController,
                            hintText: "ادخل الاسم",
                            keyboardType: TextInputType.name)
                      ],
                    ),
                  ),
                  FadeInRight(
                    delay: Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: media.width * 0.05),
                          child: const Text("  حسابك"),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                            txtController: controller.mailController,
                            hintText: "ادخل حسابك",
                            keyboardType: TextInputType.name)
                      ],
                    ),
                  ),
                  FadeInRight(
                    delay: Duration(milliseconds: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: media.width * 0.05),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: const Text("رقم الجوال")),
                        ),
                        const SizedBox(height: 11),
                        CustomTextField(
                            hintText: "ادخل رقم جوالك",
                            keyboardType: TextInputType.phone,
                            txtController: controller.numController),
                      ],
                    ),
                  ),
                  FadeInLeft(
                    delay: Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: media.width * 0.05),
                          child: const Text(" كلمة المرور"),
                        ),
                        const SizedBox(height: 10),
                        PasswordCustomTextField(
                            controller: controller.passController,
                            hintText: "ادخل  كلمة المرور",
                            keyboardType: TextInputType.text),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  ZoomIn(
                      delay: Duration(milliseconds: 600),
                      curve: Curves.linear,
                      child: PrimaryButton(
                          onTap: () {
                            controller.addEmployee();
                            clearText();
                          },
                          text: 'أضف')),
                ],
              ),
            );
          }),
    );
  }
}
