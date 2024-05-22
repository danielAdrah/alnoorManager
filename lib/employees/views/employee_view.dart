// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:elnoor_managment/employees/views/modify_emp_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/client_contact.dart';
import '../../comon_widgets/search_bar.dart';
import '../../comon_widgets/secondary_button.dart';
import '../../comon_widgets/secondary_button2.dart';
import '../../core/api/dio_consumer.dart';
import '../../theme.dart';
import '../../user_profile/view/user_profile_view.dart';
import '../controller/employee_controller.dart';
import 'add_task.dart';
import 'employee_info.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  final controller = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: FadeInDown(
            delay: Duration(milliseconds: 600), child: const Text('الموظفين')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            FadeInRight(
                delay: Duration(milliseconds: 600),
                child: CustomSearchBar(
                  hintText: "ابحث عن موظف",
                )),
            const SizedBox(height: 20),
            FutureBuilder(
                future: controller.fetchEmployee(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: TColor.primary,
                    ));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          var data = snapshot.data![index];
                          return FadeInLeft(
                              delay: Duration(milliseconds: 600),
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          data.username,
                                          style: TextStyle(
                                              color: TColor.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          data.phonenumber,
                                          style: TextStyle(
                                            color: TColor.primary,
                                            fontSize: 11,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            SecondaryButton2(
                                              text: " تعديل",
                                              onTap: () {
                                                // controller.getEmployee(data.id);

                                                Get.to(() => ModifyEmployee());
                                              },
                                            ),
                                            SizedBox(width: 20),
                                            SecondaryButton(
                                              text: 'إضافة مهمة',
                                              onTap: () {
                                                Get.to(() => AddTask());
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(width: 5),
                                    InkWell(
                                      onTap: () {
                                        // Get.to(() => UserProfileView());
                                      },
                                      child: const CircleAvatar(
                                        radius: 25,
                                        backgroundImage: AssetImage(
                                            "assets/img/bigAvatar.png"),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        }));
                  }
                })),
          ],
        ),
      ),
    );
  }
}
