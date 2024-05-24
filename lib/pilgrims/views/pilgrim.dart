import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:elnoor_managment/pilgrims/controller/pilgrim_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../chat/view/in_chat.dart';
import '../../comon_widgets/client_contact.dart';
import '../../comon_widgets/search_bar.dart';
import '../../comon_widgets/secondary_button.dart';
import '../../comon_widgets/secondary_button2.dart';
import '../../core/api/dio_consumer.dart';
import '../../theme.dart';
import '../../user_profile/view/modify_user.dart';
import '../../user_profile/view/user_profile_view.dart';

class PilgrimView extends StatefulWidget {
  const PilgrimView({super.key});

  @override
  State<PilgrimView> createState() => _PilgrimViewState();
}

class _PilgrimViewState extends State<PilgrimView> {
  final PilgrimController controller =
      Get.put(PilgrimController(api: DioConsumer(dio: Dio())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: FadeInDown(
            delay: const Duration(milliseconds: 600),
            child: const Text('الحجاج')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            FadeInRight(
                delay: const Duration(milliseconds: 600),
                child: const CustomSearchBar(
                  hintText: "ابحث عن الحاج",
                )),
            const SizedBox(height: 20),
            FutureBuilder(
                future: controller.fetchPilgrims(),
                builder: (cotext, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
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
                              delay: const Duration(milliseconds: 600),
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
                                          "${data.firstName} ${data.fatherName} ${data.lastName}",
                                          style: TextStyle(
                                              color: TColor.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          data.phonenumber,
                                          style: TextStyle(
                                            color:
                                                TColor.black.withOpacity(0.4),
                                            fontSize: 11,
                                          ),
                                        ),
                                        Text(
                                          data.hotel,
                                          style: const TextStyle(
                                              color: TColor.primary,
                                              fontSize: 9),
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            SecondaryButton2(
                                              text: "تعديل",
                                              onTap: () {
                                                controller
                                                    .updatePilgrim(data.id);
                                                Get.to(
                                                    () => const ModifyUser());
                                              },
                                            ),
                                            const SizedBox(width: 20),
                                            SecondaryButton(
                                              text: 'دردشة',
                                              onTap: () {
                                                Get.to(() => const InChat());
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(width: 5),
                                    InkWell(
                                      onTap: () {
                                        controller.getPilgrim(data.id);
                                        Get.to(() => const UserProfileView());
                                      },
                                      child: CircleAvatar(
                                          radius: 25,
                                          backgroundImage: NetworkImage(
                                              data.image.toString())
                                          // AssetImage(
                                          //     "assets/img/bigAvatar.png"),
                                          ),
                                    ),
                                  ],
                                ),
                              ));
                        }));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
