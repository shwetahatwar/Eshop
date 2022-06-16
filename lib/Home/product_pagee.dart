import 'package:eshop/Home/myDrawer.dart';
import 'package:eshop/Model/item.dart';
import 'package:eshop/Widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../Utils/colors_utils.dart';

class ProductPagee extends StatefulWidget {
  // const ProductPagee({Key? key}) : super(key: key);
  final ItemModel itemModel;
  ProductPagee({required this.itemModel});

  @override
  State<ProductPagee> createState() => _ProductPageeState();

}

class _ProductPageeState extends State<ProductPagee> {
  int quantityOfItems = 1;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
              appBar: MyAppBarCustom(),
          drawer: MyDrawer(),
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Image.network(widget.itemModel.thumbnailUrl!),
                        ),
                        Container(
                          color: Colors.grey[300],
                          height: 1.0,
                          width: double.infinity,
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.itemModel.title!,
                              style: boldTextStyle,),
                            SizedBox(
                              height: 10.0,
                            ),

                            Text(widget.itemModel.longDescription!,
                              style: boldTextStyle,),
                            SizedBox(
                              height: 10.0,
                            ),

                            Text("Rs. " + widget.itemModel.price.toString(),
                              style: boldTextStyle,),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Center(
                        child: InkWell(
                          onTap: ()=> print("clicked"),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  hexStringToColor("CB2B93"),
                                  hexStringToColor("9546C4"),
                                  hexStringToColor("5E61F4")
                                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                            width: MediaQuery.of(context).size.width - 40.0,
                            height: 50.0,
                            child: Center(
                              child: Text("Add to Cart",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

        ),
    );
  }
}
const boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
const largeTextStyle = TextStyle(fontWeight: FontWeight.normal,fontSize: 20);