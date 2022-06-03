import 'dart:html';

import 'package:eshop/Walkthrough-screens/Page4.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Utils/colors_utils.dart';
import 'adminShiftOrders.dart';
import 'package:camera/camera.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> with AutomaticKeepAliveClientMixin<UploadPage> {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  ImagePicker picker = ImagePicker();
  late File file;

  @override
  Widget build(BuildContext context) {
    return displayAdminHomeScreen();
  }

  displayAdminHomeScreen() {
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
          onPressed: () {
            Route route = MaterialPageRoute(builder: (c) => AdminShiftOrders());
            Navigator.pushReplacement(context, route);
          },
        ),
        actions: [
          FlatButton(
            child: Text("Logout", style: TextStyle(color: Colors.purpleAccent,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),),
            onPressed: () {
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
            Icon(Icons.shop_two, color: Colors.white, size: 200.0,),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0)),
                child: Text("Add New Items",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),),
                color: Colors.purple,
                onPressed: () => takeImage(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  takeImage(mContext) {
    return showDialog(context: mContext,
        builder: (con) {
          return SimpleDialog(
            title: Text("Item Image", style: TextStyle(
                color: Colors.purple, fontWeight: FontWeight.bold),),
            children: [
              SimpleDialogOption(
                child: Text("Capture with Camera",
                  style: TextStyle(color: Colors.purple),),
                onPressed: capturePhotoWithCamera,
              ),
              SimpleDialogOption(
                child: Text("Select From Gallery",
                  style: TextStyle(color: Colors.purple),),
                onPressed: pickPhotoFromGallery,
              ),
              SimpleDialogOption(
                child: Text("Cancel", style: TextStyle(color: Colors.purple),),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  // capturePhotoWithCamera() async {
  //   Navigator.pop(context);
  //   //File imageFile = await ImagePicker?.pickImage(source: ImageSource.camera, maxHeight:680.0,maxWidth:970.0);
  //   File imageFile = await ImagePicker.pickImage(source: ImageSourceType.camera, maxHeight:680.0,maxWidth:970.0);
  //
  //   setState((){
  //     file = imageFile;
  //   });
  // }
  capturePhotoWithCamera() async {
    Navigator.pop(context);
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      file = pickedFile as File;
    });
  }


  pickPhotoFromGallery() async {
    Navigator.pop(context);
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      file = pickedFile as File;
    });
  }
}
