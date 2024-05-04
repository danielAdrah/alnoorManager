import 'package:flutter/material.dart';

import '../theme.dart';

class SecondaryButton extends StatelessWidget {
   SecondaryButton({super.key, required this.text,required this.onTap});
  final String text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          decoration: BoxDecoration(
              color: TColor.primary, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(color: TColor.white),
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.message,
                color: TColor.white,
              ),
            ],
          ),
        ));
  }
}
