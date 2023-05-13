

import 'package:flutter/material.dart';


class InputFrom extends StatelessWidget {
  const InputFrom({super.key, required this.hint, required this.leadin, required this.ispass});
  final String hint;
  final Icon leadin;
  final bool ispass;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w500
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 25),
          // suffix: ispass
            // ? TextButton(
            //   style: TextButton.styleFrom(
            //     padding: const EdgeInsets.all(0),
            //     elevation: 0,
            //   ),
            //   onPressed: (){}, child: Text("Forgot?",style: TextStyle(
            //   color: Colors.blue[400],
            //   fontSize: 15,
            //   fontWeight: FontWeight.w700,
            //   )
            //   )
            //   )
            // : null,
          hintText: hint,
          prefixIcon: leadin,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black38)
          ),
          enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black38)
          ),
          disabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black38)
          ),
          focusedBorder:const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.blue)
          ),
        ),
      ),
    );
  }
}