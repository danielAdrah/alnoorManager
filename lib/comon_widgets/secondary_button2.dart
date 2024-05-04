import 'package:flutter/material.dart';

import '../theme.dart';

class SecondaryButton2 extends StatelessWidget {
   SecondaryButton2({super.key, required this.text,required this.onTap});
  final String text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          child:  Row(
            children: [
              Text(
                text,
                style: const TextStyle(color: TColor.primary),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.message,
                color: TColor.primary,
              ),
            ],
          ),
        ));
  }
}
