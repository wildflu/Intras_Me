



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/card_contact_notif.dart';


class ChatIndex extends StatelessWidget {
  const ChatIndex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const CardContactNotif();
        },
      ),
    );
  }
}
