import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../comon_widgets/custom_text_field.dart';
import '../../comon_widgets/number_text_field.dart';
import '../../comon_widgets/password_custome_text_field.dart';
import '../../comon_widgets/primary_button.dart';
import '../../theme.dart';

class NewNotification extends StatefulWidget {
  const NewNotification({super.key});

  @override
  State<NewNotification> createState() => _NewNotificationState();
}

class _NewNotificationState extends State<NewNotification> {
  final TextEditingController notiController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
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
        title: FadeInDown(
            delay: Duration(milliseconds: 800),
            child: const Text('إضافة اشعار')),
        // actions: [
        //   FadeInRight(
        //     delay: Duration(milliseconds: 800),
        //     child: IconButton(
        //         onPressed: () {
        //           Get.back();
        //         },
        //         icon: Image.asset(
        //           "assets/img/white_arrowBack.png",
        //           color: TColor.black,
        //         )),
        //   )
        // ],
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 20),
            FadeInRight(
              delay: Duration(milliseconds: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: media.width * 0.05),
                    child: const Text(" عنوان الاشعار"),
                  ),
                  const SizedBox(height: 11),
                  CustomTextField(
                    txtController: notiController,
                    hintText: "عنوان الاشعار",
                    keyboardType: TextInputType.name,
                  ),
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
                    child: const Text("  محتوي الاشعار"),
                  ),
                  // const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "محتوى الاشعار",
                        hintTextDirection: TextDirection.rtl,
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
                delay: Duration(milliseconds: 650),
                child: PrimaryButton(onTap: () {}, text: "اضف"))
          ],
        ),
      ),
    );
  }
}
