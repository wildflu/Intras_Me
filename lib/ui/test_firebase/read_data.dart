

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class TestFirebase extends StatefulWidget {
  const TestFirebase({super.key});

  @override
  State<TestFirebase> createState() => _TestFirebaseState();
}

class _TestFirebaseState extends State<TestFirebase> {

  List listmessagestest = [];

  CollectionReference prods = FirebaseFirestore.instance.collection('test');

    getdatafrom()async {
      await FirebaseFirestore.instance.collection('test').get().then((value) {
        value.docs.forEach((element) {
          listmessagestest.add(element.data());
        });
      });
      setState(() {
        
      });
    }       
  @override
  void initState() {
    super.initState();
    getdatafrom();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          print(listmessagestest);
        }, child: const Text("GetData"))
      ),
    );
  }
}