
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TheButton extends StatelessWidget {
  const TheButton({super.key, required this.text, required this.onPress});

  final String text;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.blue[300]
      ),
      onPressed: onPress,
      child: Text(text, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white),));
  }
}