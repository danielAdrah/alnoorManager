import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';
import 'add_new_notification.dart';
import 'notification_design.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FadeInDown(
            delay: Duration(milliseconds: 500),
            child: const Text(" الاشعارات")),
        centerTitle: true,
        actions: [],
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return FadeInRight(
                  delay: Duration(milliseconds: 500),
                  curve: Curves.easeInSine,
                  child: NotificationDesign());
            }),
      ),
    );
  }
}
