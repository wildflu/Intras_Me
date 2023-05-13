

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friendchat/ui/login/sign_in.dart';
import 'package:get/get.dart';

import '../../widget/card_social_media_login.dart';
import '../../widget/input_form.dart';
import '../../widget/the_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

    var email;
    var pass;
    final user = FirebaseAuth.instance.currentUser;
  creatUser()async {
    try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pass,
        );
        var credential;
        if(credential.user?.emailVerified == false) {
        final user = FirebaseAuth.instance.currentUser;
        await user!.sendEmailVerification();
        print("not");
      }else {
        print("ok");
      } 
      print(credential.user?.emailVerified);
      // await Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Signup())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
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
              child: const Text("Sign Up", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child:  Text("Sign Up With", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, color: Colors.grey[400]),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                CardsocialMediaLog(img: "assets/chatimg.svg",onclick: (){
                  
                }),
                CardsocialMediaLog(img: "assets/chatimg.svg",onclick: (){}),
                CardsocialMediaLog(img: "assets/chatimg.svg",onclick: (){}),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child:  Text("Or, Use Email", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, color: Colors.grey[400]),),
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
            const InputFrom(
              hint: "User-name",
              leadin: Icon(Icons.face_unlock_outlined),
              ispass: false,
            ),
            const InputFrom(
              hint: "phone number",
              leadin: Icon(Icons.phone),
              ispass: false,
            ),
            const InputFrom(
              hint: "Our Code",
              leadin: Icon(Icons.keyboard_command_key_rounded),
              ispass: false,
            ),
            SizedBox(height: 45,),
            TheButton(
              onPress: (){
                Get.off(()=> const SignIn());
              },
              text: "Register",
            ),
            SizedBox(height: 45,),
          ],
        ),
      ),
    );
  }
}