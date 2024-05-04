import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class StartChatView extends StatefulWidget {
  const StartChatView({super.key});

  @override
  State<StartChatView> createState() => _StartClientViewState();
}

class _StartClientViewState extends State<StartChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: FadeInDown(
            delay: Duration(milliseconds: 700),
            child: const Text('بدء الدردشة')),
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
      body: Container(),
    );
  }
}
