import 'package:eshop/SignUp.dart';
import 'package:eshop/login-screen.dart';
import 'package:flutter/material.dart';

import '../Utils/colors_utils.dart';

class AuthenticScreen extends StatefulWidget {
  const AuthenticScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticScreen> createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              // decoration: new BoxDecoration(
              //   gradient: new LinearGradient(
              //     colors: [Colors.pink, Colors.lightGreenAccent],
              //     begin: const FractionalOffset(0.0, 0.0),
              //     end: const FractionalOffset(1.0, 0.0),
              //     stops: [0.0,1.0],
              //     tileMode: TileMode.clamp,
              //   ),
              // ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    hexStringToColor("CB2B93"),
                    hexStringToColor("9546C4"),
                    hexStringToColor("5E61F4")
                  ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            title: Text(
              "e-Shop",
              style: TextStyle(fontSize: 55.0, color: Colors.white,fontFamily: "KdamThmorPro-Regular"),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.lock, color: Colors.white,),
                  text: "Login",
                ),
                Tab(
                  icon: Icon(Icons.perm_contact_calendar, color: Colors.white,),
                  text: "Register",
                )
              ],
              indicatorColor: Colors.white38,
              indicatorWeight: 5.0,
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                colors: [
                  hexStringToColor("CB2B93"),
                  hexStringToColor("9546C4"),
                  hexStringToColor("5E61F4")
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: TabBarView(
              children: [
                SignInScreen(),
                SignUpScreen(),
              ],
            ),
          ),
        ));
  }
}
