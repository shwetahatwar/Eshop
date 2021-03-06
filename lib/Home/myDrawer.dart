import 'package:eshop/Home/cart.dart';
import 'package:eshop/Home/storehome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Utils/colors_utils.dart';
import '../admin/profileScreen.dart';
import '../login-screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
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
                gradient: LinearGradient(colors: [
                  hexStringToColor("CB2B93"),
                  hexStringToColor("9546C4"),
                  hexStringToColor("5E61F4")
                ],
                    begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                  elevation: 8.0,
                  child: Container(
                    height: 160.0,
                    width: 160.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg"),
                    ),
                  ),
                ),
                SizedBox(height: 12.0,),
                Container(
                  padding: EdgeInsets.only(top: 1.0),
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
                      gradient: LinearGradient(colors: [
                        hexStringToColor("CB2B93"),
                        hexStringToColor("9546C4"),
                        hexStringToColor("5E61F4")
                      ],
                          begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.home, color: Colors.white,),
                        title: Text("Home", style: TextStyle(color: Colors.white),),
                        onTap: (){
                          Route route = MaterialPageRoute(builder: (c) => StoreHome());
                          Navigator.pushReplacement(context, route);
                        },
                      ),
                      Divider(height: 10.0, color: Colors.white,thickness: 6.0,),

                      ListTile(
                        leading: Icon(Icons.add_shopping_cart_rounded, color: Colors.white,),
                        title: Text("My Orders", style: TextStyle(color: Colors.white),),
                        onTap: (){
                          Route route = MaterialPageRoute(builder: (c) => StoreHome());
                          Navigator.pushReplacement(context, route);
                        },
                      ),
                      Divider(height: 10.0, color: Colors.white,thickness: 6.0,),

                      ListTile(
                        leading: Icon(Icons.shopping_cart, color: Colors.white,),
                        title: Text("My Cart", style: TextStyle(color: Colors.white),),
                        onTap: (){
                          Route route = MaterialPageRoute(builder: (c) => CartPage());
                          Navigator.pushReplacement(context, route);
                        },
                      ),
                      Divider(height: 10.0, color: Colors.white,thickness: 6.0,),

                      ListTile(
                        leading: Icon(Icons.search, color: Colors.white,),
                        title: Text("Search", style: TextStyle(color: Colors.white),),
                        onTap: (){
                          Route route = MaterialPageRoute(builder: (c) => StoreHome());
                          Navigator.pushReplacement(context, route);
                        },
                      ),
                      Divider(height: 10.0, color: Colors.white,thickness: 6.0,),

                      ListTile(
                        leading: Icon(Icons.location_on_outlined, color: Colors.white,),
                        title: Text("Add New Address", style: TextStyle(color: Colors.white),),
                        onTap: (){
                          Route route = MaterialPageRoute(builder: (c) => StoreHome());
                          Navigator.pushReplacement(context, route);
                        },
                      ),
                      Divider(height: 10.0, color: Colors.white,thickness: 6.0,),

                      ListTile(
                        leading: Icon(Icons.person, color: Colors.white,),
                        title: Text("Profile", style: TextStyle(color: Colors.white),),
                        onTap: (){
                          Route route = MaterialPageRoute(builder: (c) => SettingUI());
                          Navigator.pushReplacement(context, route);
                        },
                      ),
                      Divider(height: 10.0, color: Colors.white,thickness: 6.0,),

                      ListTile(
                        leading: Icon(Icons.logout, color: Colors.white,),
                        title: Text("Logout", style: TextStyle(color: Colors.white),),
                          onTap: () {
                            FirebaseAuth.instance.signOut().then((value) {
                              print("Signed Out");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SignInScreen()));
                            });
                          },
                      ),
                      Divider(height: 10.0, color: Colors.white,thickness: 6.0,),

                      ListTile(
                        leading: Icon(Icons.home, color: Colors.white,),
                        title: Text("About Us", style: TextStyle(color: Colors.white),),
                        onTap: (){
                          Route route = MaterialPageRoute(builder: (c) => StoreHome());
                          Navigator.pushReplacement(context, route);
                        },
                      ),
                      Divider(height: 10.0, color: Colors.white,thickness: 6.0,),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
