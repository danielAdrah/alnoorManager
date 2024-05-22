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
  List titles = [
    "الاسم الأول",
    "اسم الأب",
    "اسم الجد",
    "العائلة",
    "تاريخ الميلاد",
    "رقم الجوال",
    "رقم الرحلة",
    "رقم التذكرة",
    "موعد الوصول",
    "موعد الرحيل",
    "مدة الرحلة",
    "وقت الصعود",
    "رقم البوابة",
    "شركة الطيران",
    "الحالة",
    "الفندق",
    "عنوان الفندق",
    "رقم الغرفة",
    "خطوات الحاج",
    "كلمة المرور"
  ];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherController = TextEditingController();
  final TextEditingController grandFatherController = TextEditingController();
  final TextEditingController familyController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  final TextEditingController flightNumController = TextEditingController();
  final TextEditingController ticketNumController = TextEditingController();
  final TextEditingController arriveController = TextEditingController();
  final TextEditingController leaveController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController boardController = TextEditingController();
  final TextEditingController gateNumController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController hotelController = TextEditingController();
  final TextEditingController hotelAddController = TextEditingController();
  final TextEditingController roomNumController = TextEditingController();
  final TextEditingController stepsController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  clearFields() {
    nameController.clear();
    fatherController.clear();
    grandFatherController.clear();
    familyController.clear();
    dateController.clear();
    numController.clear();
    flightNumController.clear();
    ticketNumController.clear();
    arriveController.clear();
    leaveController.clear();
    durationController.clear();
    boardController.clear();
    gateNumController.clear();
    companyController.clear();
    stateController.clear();
    hotelController.clear();
    hotelAddController.clear();
    roomNumController.clear();
    stepsController.clear();
    passController.clear();
  }

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
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: media.width * 0.05),
                          child: Text(titles[index]),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          hintText: "",
                          keyboardType: (() {
                            switch (index) {
                              case 0:
                                return TextInputType.name;
                              case 1:
                                return TextInputType.name;
                              case 2:
                                return TextInputType.name;
                              case 3:
                                return TextInputType.name;
                              case 4:
                                return TextInputType.phone;
                              case 5:
                                return TextInputType.phone;
                              case 6:
                                return TextInputType.number;
                              case 7:
                                return TextInputType.number;
                              case 8:
                                return TextInputType.phone;
                              case 9:
                                return TextInputType.phone;
                              case 10:
                                return TextInputType.phone;
                              case 11:
                                return TextInputType.phone;
                              case 12:
                                return TextInputType.number;
                              case 13:
                                return TextInputType.name;
                              case 14:
                                return TextInputType.name;
                              case 15:
                                return TextInputType.name;
                              case 16:
                                return TextInputType.name;
                              case 17:
                                return TextInputType.number;
                              case 18:
                                return TextInputType.number;
                              case 19:
                                return TextInputType.name;

                              default:
                                return null; // or any other default controller
                            }
                          })(),
                          txtController: (() {
                            switch (index) {
                              case 0:
                                return nameController;
                              case 1:
                                return fatherController;
                              case 2:
                                return grandFatherController;
                              case 3:
                                return familyController;
                              case 4:
                                return dateController;
                              case 5:
                                return numController;
                              case 6:
                                return flightNumController;
                              case 7:
                                return ticketNumController;
                              case 8:
                                return arriveController;
                              case 9:
                                return leaveController;
                              case 10:
                                return durationController;
                              case 11:
                                return boardController;
                              case 12:
                                return gateNumController;
                              case 13:
                                return companyController;
                              case 14:
                                return stateController;
                              case 15:
                                return hotelController;
                              case 16:
                                return hotelAddController;
                              case 17:
                                return roomNumController;
                              case 18:
                                return stepsController;
                              case 19:
                                return passController;

                              default:
                                return TextEditingController(); // or any other default controller
                            }
                          })(),
                        ),
                      ],
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: PrimaryButton(
                  onTap: () {
                    clearFields();
                  },
                  text: "اضف"),
            ),
          ],
        ),
      ),
    );
  }
}
