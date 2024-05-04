import 'package:animate_do/animate_do.dart';
import 'package:elnoor_managment/comon_widgets/secondary_button.dart';
import 'package:elnoor_managment/comon_widgets/secondary_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../chat/view/in_chat.dart';
import '../../comon_widgets/custom_app_bar2.dart';
import '../../comon_widgets/profile_tab_button.dart';
import '../../theme.dart';
import '../model/profile_controller.dart';
import 'modify_user.dart';
import 'profile_tab1.dart';
import 'profile_tab2.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  bool isTurn = true;

  // final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: media.width * 0.6,
                  decoration: const BoxDecoration(color: TColor.primary),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomAppBar2(),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 170,
              left: 5,
              right: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                height: media.width * 1.68,
                width: media.width * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      FadeInLeft(
                        curve: Curves.linear,
                        delay: const Duration(milliseconds: 500),
                        child: Text(
                          "هنا سيكون الاسم",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: media.width * 0.05),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInRight(
                        delay: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                        child: Text(
                          "+963512218",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: media.width * 0.04),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ZoomIn(
                        delay: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 30),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(25)),
                            child: const Text(
                              "مفعل",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeInLeft(
                            delay: const Duration(milliseconds: 500),
                            child: SecondaryButton2(
                              text: "تعديل",
                              onTap: () {
                                Get.to(() => ModifyUser());
                              },
                            ),
                          ),
                          const SizedBox(width: 30),
                          FadeInRight(
                            delay: const Duration(milliseconds: 500),
                            child: SecondaryButton(
                              text: "دردشة",
                              onTap: () {
                                Get.to(() => InChat());
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FadeInLeft(
                            delay: const Duration(milliseconds: 650),
                            curve: Curves.linear,
                            child: ProfileTabButton(
                              title: "تفاصيل الرحلة",
                              isActive: !isTurn,
                              onpressed: () {
                                setState(() {
                                  isTurn = !isTurn;
                                });
                              },
                            ),
                          ),
                          FadeInRight(
                            curve: Curves.linear,
                            delay: const Duration(milliseconds: 500),
                            child: ProfileTabButton(
                              title: " معلومات السكن",
                              isActive: isTurn,
                              onpressed: () {
                                setState(() {
                                  isTurn = !isTurn;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      if (isTurn)
                        FadeInUpBig(
                            delay: const Duration(milliseconds: 500),
                            child: const ProfileTab1()),
                      if (!isTurn)
                        FadeInUpBig(
                            delay: const Duration(milliseconds: 500),
                            child: const ProfileTab2()),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: 130,
              child: ZoomIn(
                delay: const Duration(milliseconds: 600),
                child: const CircleAvatar(
                    maxRadius: 70,
                    backgroundImage: AssetImage("assets/img/bigAvatar.png")),
              ),
            ),
            Positioned(
              top: 190,
              right: 131,
              child: ZoomIn(
                delay: const Duration(milliseconds: 500),
                child: InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 15,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: TColor.primary,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
