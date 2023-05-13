

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CardsocialMediaLog extends StatelessWidget {
  const CardsocialMediaLog({super.key, required this.img, required this.onclick});

  final String img;
  final VoidCallback onclick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.black12)
        ),
        padding: const EdgeInsets.all(10),
        width: 100,
        height: 60,
        child: SvgPicture.asset(img,semanticsLabel: 'A red up arrow',),
      ),
    );
  }
}