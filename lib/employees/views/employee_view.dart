import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../comon_widgets/client_contact.dart';
import '../../comon_widgets/search_bar.dart';
import 'employee_info.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
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
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                itemBuilder: ((context, index) {
                  return FadeInLeft(
                      delay: Duration(milliseconds: 600),
                      child: EmployeeInfo());
                })),
          ],
        ),
      ),
    );
  }
}
