import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendchat/ui/content/home_screen.dart';
import 'package:friendchat/ui/login/sign_in.dart';
import 'package:friendchat/ui/test_firebase/read_data.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/theme_controller/themes_controller.dart';
import 'firebase_options.dart';


bool ?issign;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var siuser = FirebaseAuth.instance.currentUser;
  if(siuser == null) {
    issign = false;
  }else {
    issign = true;
  }
  runApp(
    GetMaterialApp(
      home: const MyApp(),
      title: "MyApp",
      theme: Themes.thetheme,
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return issign==true ? const HomeScreen() : const SignIn();
    // return const HomeScreen();
    // return const TestFirebase();
  }
}