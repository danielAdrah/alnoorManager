import 'package:animate_do/animate_do.dart';
import 'package:elnoor_managment/comon_widgets/password_custome_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/custom_text_field.dart';
import '../../comon_widgets/number_text_field.dart';
import '../../comon_widgets/primary_button.dart';
import '../../theme.dart';
import '../controller/employee_controller.dart';

class ModifyEmployee extends StatefulWidget {
  const ModifyEmployee({super.key});

  @override
  State<ModifyEmployee> createState() => _ModifyEmployeeState();
}

class _ModifyEmployeeState extends State<ModifyEmployee> {
  final controller = Get.put(EmployeeController());

  clearFields() {
    controller.updatedEmpnameController.clear();
    controller.updatedEmpnumController.clear();
    controller.updatedEmpmailController.clear();
    controller.updatedEmppassController.clear();
  }

  List<String> titles = ["الاسم", "رقم الجوال", "الإيميل", "كلمة السر"];

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
          child: GetBuilder<EmployeeController>(
              init: EmployeeController(),
              builder: (controller) {
                return Column(children: [
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
                        return Column(
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
                              keyboardType: (() {
                                switch (index) {
                                  case 0:
                                    return TextInputType.name;

                                  case 1:
                                    return TextInputType.phone;

                                  case 2:
                                    return TextInputType.emailAddress;

                                  default:
                                    return TextInputType
                                        .name; // or any other default controller
                                }
                              })(),
                              txtController: (() {
                                switch (index) {
                                  case 0:
                                    return controller.updatedEmpnameController;

                                  case 1:
                                    return controller.updatedEmpnumController;
                                  case 2:
                                    return controller.updatedEmpmailController;

                                  case 3:
                                    return controller.updatedEmppassController;

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
                        print(controller.updatedEmpnameController.text);
                        print(controller.updatedEmpnumController.text);
                        print(controller.updatedEmpmailController.text);
                        print(controller.updatedEmppassController.text);
                        controller.updateEmployee();
                        clearFields();
                      },
                      text: "حفظ"),
                ]);
              })),
    );
  }
}
