import 'package:animate_do/animate_do.dart';
import 'package:elnoor_managment/comon_widgets/custom_text_field.dart';
import 'package:elnoor_managment/comon_widgets/primary_button.dart';
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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController numController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            FadeInLeft(
              delay: Duration(milliseconds: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: media.width * 0.05),
                    child: const Text("  الاسم"),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                      txtController: nameController,
                      hintText: "ادخل الاسم",
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
                    padding:
                        EdgeInsets.symmetric(horizontal: media.width * 0.05),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: const Text("رقم الجوال")),
                  ),
                  const SizedBox(height: 11),
                  NumberTextField(
                    controller: numController,
                    labelText: "ادخل رقم جوالك",
                    onChanged: (p0) {},
                  )
                ],
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: media.width * 0.05),
                    child: const Text(" كلمة المرور"),
                  ),
                  const SizedBox(height: 10),
                  PasswordCustomTextField(
                      controller: passController,
                      hintText: "ادخل  كلمة المرور",
                      keyboardType: TextInputType.text),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ZoomIn(
                delay: Duration(milliseconds: 600),
                curve: Curves.linear,
                child: PrimaryButton(onTap: () {}, text: 'أضف')),
          ],
        ),
      ),
    );
  }
}
