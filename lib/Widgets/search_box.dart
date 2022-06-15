import 'package:flutter/material.dart';

import '../Home/search_product.dart';
import '../Utils/colors_utils.dart';

class SearchBoxDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) =>
      InkWell(
        onTap: ()
        {
          Route route = MaterialPageRoute(builder: (c) => SearchProduct());
          Navigator.pushReplacement(context, route);
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ], begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 80.0,
          child: InkWell(
            child: Container(
              margin: EdgeInsets.only(left: 10.0 , right: 10.0),
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Search Here"),
                  )
                ],
              ),
            ),
          ),
        )
      );

  @override
  // TODO: implement maxExtent
  double get maxExtent => 80;

  @override
  // TODO: implement minExtent
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

}