import 'package:elnoor_managment/comon_widgets/secondary_button.dart';
import 'package:elnoor_managment/comon_widgets/secondary_button2.dart';
import 'package:elnoor_managment/employees/views/modify_emp_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';
import '../../user_profile/view/user_profile_view.dart';
import 'add_task.dart';

class EmployeeInfo extends StatefulWidget {
  const EmployeeInfo({super.key});

  @override
  State<EmployeeInfo> createState() => _EmployeeInfoState();
}

class _EmployeeInfoState extends State<EmployeeInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "the name ",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              Text(
                "the number ",
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
              Get.to(() => UserProfileView());
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/img/bigAvatar.png"),
            ),
          ),
        ],
      ),
    );
  }
}
