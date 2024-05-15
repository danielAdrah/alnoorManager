import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';
import '../controller/notification_controller.dart';
import 'add_new_notification.dart';
import 'notification_design.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FadeInDown(
            delay: Duration(milliseconds: 500),
            child: const Text(" الاشعارات")),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GetBuilder<NotificationController>(
            init: NotificationController(),
            builder: (controller) {
              return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return FadeInRight(
                        delay: Duration(milliseconds: 500),
                        curve: Curves.easeInSine,
                        child: InkWell(
                          onTap: () {
                            controller.showNotification();
                          },
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "the name of the noti ",
                                        style: TextStyle(
                                            color: TColor.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "the content of the noti ",
                                        style: TextStyle(
                                          color: TColor.black.withOpacity(0.4),
                                          fontSize: 11,
                                        ),
                                      ),
                                      const Text(
                                        "the time of the noti",
                                        style: TextStyle(
                                            color: TColor.primary, fontSize: 9),
                                      ),
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    "assets/img/arrowBack_icon.jpg",
                                  )
                                ]),
                          ),
                        ));
                  });
            }),
      ),
    );
  }
}
