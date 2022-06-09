import 'package:eshop/Home/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Utils/colors_utils.dart';
import 'cart.dart';
import 'cartitemcounter.dart';

double? width;

class StoreHome extends StatefulWidget {
  const StoreHome({Key? key}) : super(key: key);

  @override
  State<StoreHome> createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    hexStringToColor("CB2B93"),
                    hexStringToColor("9546C4"),
                    hexStringToColor("5E61F4")
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
            title: Text(
              "e-Shop",
              style: TextStyle(fontSize: 55.0, color: Colors.white,fontFamily: "CharisSIL-Regular"),
            ),
            centerTitle: true,
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon:Icon(Icons.shopping_cart,color: Colors.purpleAccent,),
                    onPressed: ()
                    {
                      Route route = MaterialPageRoute(builder: (c) => CartPage());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                  Positioned(
                      child: Stack(
                        children: [
                          Icon(
                            Icons.brightness_1,
                            size: 20.0,
                            color: Colors.blue,
                          ),
                          Positioned(
                            top: 3.0,
                              bottom: 4.0,
                              child: Consumer<CartItemCounter>(
                                  builder: (context, counter , _)
                                      {
                                        return Text(
                                          counter.count.toString(),
                                          style: TextStyle(color: Colors.white,fontSize: 12.0, fontWeight: FontWeight.w500),
                                        );
                                      }
                              ),
                          ),
                        ],
                      ))
                ],
              )
            ],
          ),
          drawer: MyDrawer(),
        ),
    );
  }
}

