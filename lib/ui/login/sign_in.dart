import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:friendchat/ui/login/register.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../widget/card_social_media_login.dart';
import '../../widget/input_form.dart';
import '../../widget/the_button.dart';
import '../content/home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


    print(googleUser?.email);
    print(googleUser?.id);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              height:  MediaQuery.of(context).size.width /2,
              child: SvgPicture.asset("assets/chatimg.svg",semanticsLabel: 'A red up arrow',),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: const Text("Login", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
            ),
            const InputFrom(
              hint: "Email Address",
              leadin: Icon(Icons.alternate_email_rounded),
              ispass: false,
            ),
            const InputFrom(
              hint: "Password",
              leadin: Icon(Icons.lock_outline),
              ispass: true,
            ),
            SizedBox(height: 30,),
            TheButton(
              onPress: (){
                Get.to(()=> const HomeScreen());
              },
              text: "Login",
            ),
            SizedBox(height: 30,),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child:  Text("Or, login With", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, color: Colors.grey[400]),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardsocialMediaLog(img: "assets/chatimg.svg",onclick: ()async{
                  await signInWithGoogle();
                }),
                CardsocialMediaLog(img: "assets/chatimg.svg",onclick: (){}),
                CardsocialMediaLog(img: "assets/chatimg.svg",onclick: (){}),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New in Friendly?", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1),),
                  TextButton(onPressed: (){
                    Get.to(()=> const Register());
                  }, child: const Text("Register", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
