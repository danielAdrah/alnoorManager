// import 'package:animate_do/animate_do.dart';
// import 'package:elnoor_guide/Live/views/live_view.dart';
// import 'package:elnoor_guide/add_notification/views/add_notification.dart';
// import 'package:elnoor_guide/chat/views/chat_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomFloatingButton extends StatelessWidget {
//   CustomFloatingButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ZoomIn(
//       delay: const Duration(milliseconds: 800),
//       child: InkWell(
//         onTap: () {
//           return _showAlertDialog(context);
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(40),
//           ),
//           child: Image.asset("assets/img/floating_button.png"),
//         ),
//       ),
//     );
//   }
// }

// void _showAlertDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       var media = MediaQuery.of(context).size;

//       return AlertDialog(
//         content: Container(
//           height: media.width * 0.73,
//           width: media.width * 0.8,
//           child: GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
//               itemCount: 4,
//               itemBuilder: ((context, index) {
//                 List<String> images = [
//                   "assets/img/startChat.png",
//                   "assets/img/addNotification.png",
//                   "assets/img/startLive.png",
//                   "assets/img/addNote.png"
//                 ];
//                 List<String> titles = [
//                   "بدء دردشة ",
//                   "اضافة اشعار",
//                   "بث مباشر",
//                   "اضافة ملاحظات"
//                 ];
//                 return InkWell(
//                   onTap: () {
//                     if (index == 1) {
//                       Get.to(() => const AddNotification());
//                     }
//                     if (index == 0) {
//                       Get.to(() => const ChatView());
//                     }
//                     if (index == 2) {
//                       Get.to(() => const LiveView());
//                     }
//                     if (index == 3) {
//                       Get.to(() => const AddNotification());
//                     }
//                   },
//                   child: ZoomIn(
//                     delay: const Duration(milliseconds: 300),
//                     curve: Easing.legacy,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey.withOpacity(0.3)),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(images[index]),
//                           const SizedBox(height: 10),
//                           Text(titles[index]),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               })),
//         ),
//       );
//     },
//   );
// }
