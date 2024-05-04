import 'package:flutter/material.dart';

import '../../theme.dart';

class NotificationDesign extends StatelessWidget {
  const NotificationDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                style: TextStyle(color: TColor.primary, fontSize: 9),
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
    );
  }
}
