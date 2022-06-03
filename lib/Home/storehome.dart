import 'package:eshop/Home/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [Colors.pink, Colors.lightGreenAccent],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp,
                ),
              ),
            ),
            title: Text(
              "e-Shop",
              style: TextStyle(fontSize: 55.0, color: Colors.white,fontFamily: "KdamThmorPro-Regular"),
            ),
            centerTitle: true,
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon:Icon(Icons.shopping_cart,color: Colors.pink,),
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
                            color: Colors.green,
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

