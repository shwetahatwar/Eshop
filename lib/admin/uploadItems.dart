import 'package:eshop/Walkthrough-screens/Page4.dart';
import 'package:flutter/material.dart';

import '../Utils/colors_utils.dart';
import 'adminShiftOrders.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> with AutomaticKeepAliveClientMixin<UploadPage> {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return displayAdminHomeScreen();
  }
displayAdminHomeScreen(){
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
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
        leading: IconButton(
          icon: Icon(Icons.border_color, color: Colors.white,),
          onPressed: (){
            Route route = MaterialPageRoute(builder: (c) => AdminShiftOrders());
            Navigator.pushReplacement(context, route);
          },
        ),
        actions: [
          FlatButton(
            child: Text("Logout",style: TextStyle(color: Colors.purpleAccent, fontSize: 16.0, fontWeight: FontWeight.bold),),
            onPressed: (){
              Route route = MaterialPageRoute(builder: (c) => Page4());
              Navigator.pushReplacement(context, route);
            },
          )
        ],
      ),
      body: getAdminHomeScreenBody(),
    );
}

  getAdminHomeScreenBody() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shop_two,color: Colors.white,size: 200.0,),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
                child: Text("Add New Items",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                color: Colors.purple,
                onPressed: () => print("click"),
              ),
            )
          ],
        ),
      ),
    );
  }

}
