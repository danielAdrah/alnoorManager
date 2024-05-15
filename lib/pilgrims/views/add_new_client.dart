import 'package:animate_do/animate_do.dart';
import 'package:elnoor_managment/comon_widgets/custom_text_field.dart';
import 'package:elnoor_managment/comon_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/number_text_field.dart';
import '../../comon_widgets/password_custome_text_field.dart';
import '../../theme.dart';

class AddNewClient extends StatefulWidget {
  const AddNewClient({super.key});

  @override
  State<AddNewClient> createState() => _AddNewClientState();
}

class _AddNewClientState extends State<AddNewClient> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FadeInDown(
            delay: const Duration(milliseconds: 700),
            child: const Text('إضافة حاج ')),
        centerTitle: true,
        actions: [
          FadeInRight(
            delay: const Duration(milliseconds: 500),
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
              delay: const Duration(milliseconds: 500),
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
              delay: const Duration(milliseconds: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: media.width * 0.05),
                    child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text("رقم الجوال")),
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
              delay: const Duration(milliseconds: 500),
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
                delay: const Duration(milliseconds: 600),
                curve: Curves.linear,
                child: PrimaryButton(onTap: () {}, text: 'أضف')),
          ],
        ),
      ),
    );
  }
}
