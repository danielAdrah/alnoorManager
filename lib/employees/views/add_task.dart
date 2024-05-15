import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:elnoor_managment/core/api/dio_consumer.dart';
import 'package:elnoor_managment/employees/controller/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/custom_text_field.dart';
import '../../comon_widgets/number_text_field.dart';
import '../../comon_widgets/password_custome_text_field.dart';
import '../../comon_widgets/primary_button.dart';
import '../../theme.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final controller = Get.put(EmployeeController(api: DioConsumer(dio: Dio())));
  clearText() {
    controller.taskName.clear();
    controller.taskContent.clear();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
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
        title: FadeInDown(
            delay: const Duration(milliseconds: 800),
            child: const Text('إضافة مهمة')),
      ),
      body: GetBuilder<EmployeeController>(
          init: EmployeeController(api: DioConsumer(dio: Dio())),
          builder: (controller) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    FadeInRight(
                      delay: const Duration(milliseconds: 500),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: media.width * 0.05),
                            child: const Text(" عنوان المهمة"),
                          ),
                          const SizedBox(height: 11),
                          CustomTextField(
                            txtController: controller.taskName,
                            hintText: "عنوان المهمة",
                            keyboardType: TextInputType.name,
                          ),
                        ],
                      ),
                    ),
                    FadeInLeft(
                      delay: const Duration(milliseconds: 500),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: media.width * 0.05),
                            child: const Text("  محتوي المهمة"),
                          ),
                          // const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              textAlign: TextAlign.end,
                              controller: controller.taskContent,
                              maxLines: 6,
                              decoration: InputDecoration(
                                hintText: "محتوى المهمة",
                                hintTextDirection: TextDirection.ltr,
                                focusedBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: TColor.primary)
                                  
                                ) ,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ZoomIn(
                        curve: Curves.linear,
                        delay: const Duration(milliseconds: 650),
                        child: PrimaryButton(
                            onTap: () {
                              controller.addTask();
                              clearText();
                            },
                            text: "اضف"))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
