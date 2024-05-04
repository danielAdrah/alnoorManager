import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class InChat extends StatefulWidget {
  const InChat({super.key});

  @override
  State<InChat> createState() => _InChatState();
}

class _InChatState extends State<InChat> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Title'),
        backgroundColor: TColor.primary,
        actions: [
          CircleAvatar(),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset("assets/img/whiteArr.png"))
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: media.width * 0.3,
                  decoration: const BoxDecoration(color: TColor.primary),
                )
              ],
            ),
            Positioned(
                top: 85,
                left: 5,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: TColor.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  height: media.width * 1.68,
                  width: media.width * 0.9,
                ))
          ],
        ),
      ),
    );
  }
}
