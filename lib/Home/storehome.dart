import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/Home/body.dart';
import 'package:eshop/Home/myDrawer.dart';
import 'package:eshop/Home/product_pagee.dart';
import 'package:eshop/Home/total_money_amount.dart';
import 'package:eshop/Model/item.dart';
import 'package:eshop/admin/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/sliver.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../Utils/colors_utils.dart';
import '../Widgets/search_box.dart';
import 'cart.dart';
import 'cartitemcounter.dart';
import 'change_address.dart';
import 'item_quantity.dart';
import 'dart:core';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => CartItemCounter()),
        ChangeNotifierProvider(create: (c) => ItemQuantity()),
        ChangeNotifierProvider(create: (c) => AddressChange()),
        ChangeNotifierProvider(create: (c) => TotalAmount()),
    ],
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
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(pinned: true,delegate: SearchBoxDelegate()),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("items").limit(15).orderBy("publishedDate", descending: true).snapshots(),
                builder: (context,AsyncSnapshot snapshot){
                  return !snapshot.hasData
                      ? SliverToBoxAdapter(child: Center(child: circularProgress(),),)
                      : SliverStaggeredGrid.countBuilder(
                    crossAxisCount: 1,
                    staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                    itemBuilder: (context, index){
                     //ItemModel model = ItemModel.fromJson(snapshot.data?.docs[index].data);
                      ItemModel model = ItemModel.fromJson(snapshot.data!.docs[index].data());
                      //snapshot.data!.docs[index].data()
                      return sourceInfo(model, context);
                    },
                    itemCount: snapshot.data?.docs.length,
                   
                  );
                }
              )
            ],
          ),
        ),
    );
  }
}
//design for each product display on the storehome page
Widget sourceInfo(ItemModel model, BuildContext context,{
   Color? background, removeCartFunction
}){
  return InkWell(
    onTap: (){
      //reciving data on product page by name itemmodel
      Route route = MaterialPageRoute(builder: (c) => ProductPagee(itemModel: model));
      Navigator.pushReplacement(context, route);
    },
    splashColor: Colors.pink,
    child: Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        height: 190.0,
        width: width,
        child: Row(
          children: [
            Image.network(model.thumbnailUrl!, width: 140.0, height: 140.0,),
            SizedBox(width: 4.0,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.0,),
                    Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(child: Text(model.title!, style: TextStyle(color: Colors.black, fontSize: 14.0),),
                              ),
                            ],
                          ),
                    ),
                    SizedBox(height: 5.0,),
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(child: Text(model.shortInfo!, style: TextStyle(color: Colors.black54, fontSize: 12.0),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.pink,
                          ),
                          alignment: Alignment.topLeft,
                          width: 40.0,
                          height: 43.0,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("50%",style: TextStyle(fontSize:15.0, color: Colors.white,fontWeight: FontWeight.normal),),
                                Text("OFF%",style: TextStyle(fontSize:12.0, color: Colors.white,fontWeight: FontWeight.normal),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 0.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Original Price: Rs.",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    (model.price! + model.price!).toString(),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Text(
                                    r"New Price: Rs.",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  Text("Rs.",
                                  style: TextStyle(color: Colors.red, fontSize: 16.0),),
                                  Text(
                                    (model.price).toString(),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Flexible(child: Container(

                    )),
                  ],
                ) )
          ],
        ),
      ),
    ),
  );
}

Widget card({Color primaryColor = Colors.redAccent,  required String imgPath}){
  return Container();
}
