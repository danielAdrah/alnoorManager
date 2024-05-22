// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:elnoor_managment/comon_widgets/secondary_button.dart';
import 'package:elnoor_managment/comon_widgets/secondary_button2.dart';
import 'package:elnoor_managment/core/api/dio_consumer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../chat/view/in_chat.dart';
import '../../comon_widgets/custom_app_bar2.dart';
import '../../comon_widgets/profile_tab_button.dart';
import '../../employees/controller/employee_controller.dart';
import '../../pilgrims/controller/pilgrim_controller.dart';
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

  final PilgrimController controller =
      Get.put(PilgrimController(api: DioConsumer(dio: Dio())));

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
                    child: Obx(
                  () => Column(
                    children: [
                      const SizedBox(height: 80),
                      FadeInLeft(
                        curve: Curves.linear,
                        delay: const Duration(milliseconds: 500),
                        child: Text(
                          "${controller.onePilgrim.value?.firstName} ${controller.onePilgrim.value?.fatherName} ${controller.onePilgrim.value?.lastName}",
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
                          "${controller.onePilgrim.value?.phonenumber}",
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
                            child: Text(
                              controller.onePilgrim.value!.active
                                  ? "مفعل"
                                  : "غير مغعل",
                              style: TextStyle(
                                  color: controller.onePilgrim.value!.active
                                      ? Colors.green
                                      : Colors.red,
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
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 20, bottom: 25, right: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: TColor.black.withOpacity(0.1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${controller.onePilgrim.value!.hotel}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(height: 5),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: TColor.primary,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: TColor.primary,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: TColor.primary,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(controller.onePilgrim.value!
                                                .hotelAddress),
                                            Icon(
                                              Icons.location_on,
                                              color: TColor.primary,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(controller
                                                .onePilgrim.value!.roomNum
                                                .toString()),
                                            Icon(
                                              Icons.roofing_outlined,
                                              color: TColor.primary,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: TColor.black
                                                  .withOpacity(0.1)),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: CircleAvatar(
                                        backgroundColor: TColor.white,
                                        child: const Icon(
                                          Icons.house_outlined,
                                          color: TColor.primary,
                                        ),
                                        // backgroundImage:
                                        //     AssetImage("assets/img/hotel.png"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      if (!isTurn)
                        FadeInUpBig(
                          delay: const Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, right: 10, left: 10, bottom: 30),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, bottom: 30, right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: TColor.black.withOpacity(0.1),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "التاريخ",
                                            style: TextStyle(
                                                color: TColor.black
                                                    .withOpacity(0.4),
                                                fontSize: 20),
                                          ),
                                          //here will be the date of the trape from the back
                                          Text(controller
                                              .onePilgrim.value!.flightDate
                                              .toString()
                                              .substring(0, 11)),
                                        ],
                                      ),
                                      Image(
                                        image: NetworkImage(
                                            "${controller.onePilgrim.value!.companyLogo}"),
                                        height: media.height * 0.07,
                                        width: media.height * 0.07,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "رقم الرحلة",
                                            style: TextStyle(
                                                color: TColor.black
                                                    .withOpacity(0.4),
                                                fontSize: 20),
                                          ),
                                          //here will be the date of the trape from the back
                                          Text(controller
                                              .onePilgrim.value!.flightNum
                                              .toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Divider(),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            controller.onePilgrim.value!.toCity,
                                            style: TextStyle(
                                                color: TColor.primary,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            "الوصول",
                                            style: TextStyle(
                                                color: TColor.black
                                                    .withOpacity(0.4),
                                                fontSize: 19),
                                          ),
                                          Text(controller
                                              .onePilgrim.value!.arrival),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Icon(
                                            Icons.connecting_airports_rounded,
                                            color: TColor.primary,
                                            size: 40,
                                          ),
                                          Text(
                                            "وقت الرحلة",
                                            style: TextStyle(
                                                color: TColor.black
                                                    .withOpacity(0.4),
                                                fontSize: 20),
                                          ),
                                          Text(controller
                                              .onePilgrim.value!.duration),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            controller
                                                .onePilgrim.value!.fromCity,
                                            style: TextStyle(
                                                color: TColor.primary,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            "المغادرة",
                                            style: TextStyle(
                                                color: TColor.black
                                                    .withOpacity(0.4),
                                                fontSize: 19),
                                          ),
                                          Text(controller
                                              .onePilgrim.value!.departure),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Divider(),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "رقم البوابة",
                                            style: TextStyle(
                                                color: TColor.black
                                                    .withOpacity(0.4),
                                                fontSize: 19),
                                          ),
                                          Text(controller
                                              .onePilgrim.value!.gateNum
                                              .toString()),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            " وقت الصعود",
                                            style: TextStyle(
                                                color: TColor.black
                                                    .withOpacity(0.4),
                                                fontSize: 19),
                                          ),
                                          Text(controller
                                              .onePilgrim.value!.boardingTime),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Divider(),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 15),
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Text(
                                            controller.onePilgrim.value!.status
                                                ? "في الموعد"
                                                : "ليس في الموعد",
                                            style: TextStyle(
                                                color: controller.onePilgrim
                                                        .value!.status
                                                    ? Colors.green
                                                    : Colors.red,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "  الحالة",
                                        style: TextStyle(
                                            color:
                                                TColor.black.withOpacity(0.4),
                                            fontSize: 19),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                )),
              ),
            ),
            Positioned(
              top: 100,
              right: 130,
              child: ZoomIn(
                delay: const Duration(milliseconds: 600),
                child: CircleAvatar(
                  maxRadius: 70,
                  backgroundImage:
                      NetworkImage(controller.onePilgrim.value!.image),
                  // AssetImage("assets/img/bigAvatar.png")
                ),
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
