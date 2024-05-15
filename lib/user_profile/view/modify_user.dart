import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:elnoor_managment/comon_widgets/custom_text_field.dart';
import 'package:elnoor_managment/comon_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/number_text_field.dart';
import '../../theme.dart';

class ModifyUser extends StatefulWidget {
  const ModifyUser({super.key});

  @override
  State<ModifyUser> createState() => _ModifyUserState();
}

class _ModifyUserState extends State<ModifyUser> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController hotelnameController = TextEditingController();
  final TextEditingController hotelLocController = TextEditingController();
  final TextEditingController roomController = TextEditingController();
  clearFields() {
    nameController.clear();
    numberController.clear();
    mailController.clear();
    hotelnameController.clear();
    hotelLocController.clear();
    roomController.clear();
  }

  List<String> titles = [
    "الاسم",
    "رقم الجوال",
    "الإيميل",
    "اسم الفندق",
    "عنوان الفندف",
    "رقم الغرفة"
  ];

  List<String> hintText = [];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: FadeInDown(
            delay: Duration(milliseconds: 600),
            child: const Text('تعديل الحساب')),
        actions: [
          FadeInRight(
            delay: Duration(milliseconds: 600),
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
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              ZoomIn(
                delay: const Duration(milliseconds: 600),
                child: const CircleAvatar(
                    maxRadius: 70,
                    backgroundImage: AssetImage("assets/img/bigAvatar.png")),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                  separatorBuilder: (context, inx) {
                    return SizedBox(height: media.height * 0.02);
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return FadeInLeft(
                      delay: Duration(milliseconds: 600),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: media.width * 0.05),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(titles[index])),
                          ),
                          CustomTextField(
                            hintText: "",
                            keyboardType: index == 1
                                ? TextInputType.phone
                                : TextInputType.name,
                            txtController: (() {
                              switch (index) {
                                case 0:
                                  return nameController;

                                case 2:
                                  return mailController;
                                case 3:
                                  return hotelnameController;
                                case 4:
                                  return hotelLocController;
                                case 5:
                                  return roomController;
                                default:
                                  return TextEditingController(); // or any other default controller
                              }
                            })(),
                          )
                        ],
                      ),
                    );
                  }),
              ZoomIn(
                delay: Duration(milliseconds: 600),
                curve: Curves.decelerate,
                child: PrimaryButton(
                    onTap: () {
                      print(nameController.text);
                      print(numberController.text);
                      print(mailController.text);
                      print(hotelLocController.text);
                      print(hotelLocController.text);
                      print(roomController.text);
                      clearFields();
                    },
                    text: "حفظ"),
              ),
            ]),
      ),
    );
  }
}
