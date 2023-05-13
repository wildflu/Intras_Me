
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/content/convertation_view.dart';

class CardContactNotif extends StatelessWidget {
  const CardContactNotif({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> const ConvertationView());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))
        ) ,
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: CircleAvatar(),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text("Name Of Fri"),
                  ),
                  Text("the content of the message time none for such as know")
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  Text("12:21"),
                  SizedBox(height: 10,),
                  Icon(CupertinoIcons.conversation_bubble)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}