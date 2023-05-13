
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendchat/ui/content/chat_index.dart';
import 'package:friendchat/ui/content/medial_index.dart';
import 'package:friendchat/ui/content/share_index.dart';
import 'package:get/get.dart';

import '../../controller/ui_controller/btm_bar_controller.dart';
import 'home_index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController btnNavCon = Get.put(NavBarController());
    List homePages = [
      HomeINdex(),
      ChatIndex(),
      MediaIndex(),
      ShareIndex(),
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text("Friends", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),),
        centerTitle: true,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: const Color.fromARGB(255, 158, 250, 248),
        backgroundColor: Colors.white,
        items: const <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.home_mini_outlined, size: 30),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.conversation_bubble, size: 30),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.viewfinder_circle, size: 30),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.share, size: 30),
          ),
        ],
        onTap: (index) => btnNavCon.setIndexPage(index),
      ),
      body: Obx(() => homePages[btnNavCon.indexPage.value])
    );
  }
}



