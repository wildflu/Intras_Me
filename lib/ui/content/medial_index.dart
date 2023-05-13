

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MediaIndex extends StatelessWidget {
  const MediaIndex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue
            ),
            height: MediaQuery.of(context).size.height - 500,
            width: MediaQuery.of(context).size.width - 50,
            child: Stack(
              children: [
                
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
                        const SizedBox(width: 20,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.comment_outlined)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}