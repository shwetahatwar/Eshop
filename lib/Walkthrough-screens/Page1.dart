import 'package:flutter/material.dart';

import '../Utils/colors_utils.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/istockphoto-854321536-1024x1024.jpg',
              height: 400.0,width: 400.0,),
            Center(
              child: Text('Whoever said money cant buy happiness simply didnt know where to go shopping',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}