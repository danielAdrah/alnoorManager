import 'package:animate_do/animate_do.dart';
import 'package:elnoor_managment/comon_widgets/password_custome_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/custom_text_field.dart';
import '../../comon_widgets/number_text_field.dart';
import '../../comon_widgets/primary_button.dart';
import '../../theme.dart';

class ModifyEmployee extends StatefulWidget {
  const ModifyEmployee({super.key});

  @override
  State<ModifyEmployee> createState() => _ModifyEmployeeState();
}

class _ModifyEmployeeState extends State<ModifyEmployee> {
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  clearFields() {
    nameController.clear();
    mailController.clear();
    passController.clear();
  }

  List<String> titles = ["الاسم", "ff", "الإيميل", "d"];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: FadeInDown(
            delay: Duration(milliseconds: 500),
            child: const Text('تعديل بيانات الموظف')),
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
        child: Column(children: [
          SizedBox(
            height: media.width * 0.2,
          ),
          ListView.separated(
              separatorBuilder: (context, inx) {
                return SizedBox(height: 15);
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: titles.length,
              itemBuilder: (context, index) {
                if (index == 1) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: media.width * 0.05),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("رقم الجوال")),
                      ),
                      NumberTextField(
                        controller: numController,
                        labelText: "رقمك",
                        onChanged: (e) {
                          String fullPhoneNumber =
                              "${e.countryCode}${e.number}";
                          // onChanged?.call(fullPhoneNumber);
                        },
                      ),
                    ],
                  );
                }
                if (index == 3) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: media.width * 0.05),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("رقم الجوال")),
                      ),
                      PasswordCustomTextField(
                          hintText: "ادخل كلمة المرور",
                          keyboardType: TextInputType.name,
                          controller: passController)
                    ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: media.width * 0.05),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(titles[index])),
                    ),
                    CustomTextField(
                      hintText: "",
                      keyboardType: TextInputType.name,
                      txtController: (() {
                        switch (index) {
                          case 0:
                            return nameController;

                          case 2:
                            return mailController;

                          default:
                            return TextEditingController(); // or any other default controller
                        }
                      })(),
                    )
                  ],
                );
              }),
          PrimaryButton(
              onTap: () {
                print(nameController.text);
                print(numController.text);
                print(mailController.text);
                print(passController.text);
                clearFields();
              },
              text: "حفظ"),
        ]),
      ),
    );
  }
}
