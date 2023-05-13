

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';



final _firebasestore = FirebaseFirestore.instance;
late User sinuser;

class ConvertationView extends StatefulWidget {
  const ConvertationView({super.key});

  @override
  State<ConvertationView> createState() => _ConvertationViewState();
}

class _ConvertationViewState extends State<ConvertationView> {


    final messageTextControler = TextEditingController();
  final _auth = FirebaseAuth.instance ;
  String? messagete;

  @override
  void initState() {
    super.initState();
    getcurant();
  }




  void getcurant() {
    final user = _auth.currentUser;
    try {
      if(user != null) {
      sinuser = user;
      print(sinuser.email);
      }
    }catch(x) {
      print(x);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("name of messa", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
      ),
      body: Column(
        children: [


          const Massegstrimbulder(),
          Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    controller: messageTextControler,
                      onChanged: (val){
                        messagete = val;
                      },
                    decoration: InputDecoration(
                      hintText: 'Message',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(onPressed: (){
                    messageTextControler.clear();
                    _firebasestore.collection('chat').add({
                      'message':messagete,
                      'simdername': sinuser.email,
                      'time': Timestamp.now(),
                    });
                  }, icon: const Icon(Icons.send)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TheMessage extends StatelessWidget {
  const TheMessage({super.key, required this.message, required this.iscurant});
  final String message;
  final bool iscurant;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: iscurant ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          iscurant 
          ?Container()
          :CircleAvatar(
            radius: 20,
            backgroundColor: Colors.amber[100],
          ),
          iscurant
          ?Text("32:23", style: TextStyle(fontSize: 11),)
          :Text(""),
          Container(
            width: MediaQuery.of(context).size.width / 1.7,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: iscurant? Colors.grey :Colors.amber[100]
            ),
            child: Text(message),
          ),
          iscurant
          ?const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
          )
          :Container(),
          iscurant
          ?Text("")
          :Text("32:23", style: TextStyle(fontSize: 11),)
        ],
      ),
    );
  }
}
class Massegstrimbulder extends StatelessWidget {
  const Massegstrimbulder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
              stream: _firebasestore.collection('chat').snapshots(),
              builder: (context, snapshot) {
                List<TheMessage> messagwidget = [];
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }
                final message = snapshot.data!.docs;
                for (var messg in message) {
                  final messagText = messg.get('message');
                  final messagsender = messg.get('simdername');
                  final curantuser = sinuser.email;
                  // final messafewidg = Text('$messagText - $messagsender',style: TextStyle(fontSize: 20),);
                  final messafewidg = TheMessage(message: messagText,iscurant: curantuser == messagsender,);
                  messagwidget.add(messafewidg);
                }
                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    children: messagwidget,
                  ),
                );
              }
            );
  }
}