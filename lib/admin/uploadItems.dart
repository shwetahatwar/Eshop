import 'dart:io';
import 'package:eshop/Walkthrough-screens/Page4.dart';
import 'package:eshop/admin/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
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
  //ImagePicker picker = ImagePicker();
  //File? file;
  File? imageFile;
  //final ImagePicker imagePicker = ImagePicker();
  //File? imageFile;
  TextEditingController _descriptiontextEditingController = TextEditingController();
  TextEditingController _pricetextEditingController = TextEditingController();
  TextEditingController _titletextEditingController = TextEditingController();
  TextEditingController _shortInfotextEditingController = TextEditingController();
  String productId = DateTime.now().microsecondsSinceEpoch.toString();
  bool uploading = false;

  //File? get file => null;

  @override
  Widget build(BuildContext context) {
    return imageFile == null ? displayAdminHomeScreen() : displayAdminUploadFormScreen();
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
  
 Future capturePhotoWithCamera() async {
    Navigator.pop(context);
    try{
      final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

      if(imageFile == null) return;

      final imageTemp = File(imageFile.path);
      setState((){
        this.imageFile = imageTemp;
      });
    } on PlatformException catch(e){
      print("failed to pick image: $e");
    }
  }

  Future pickPhotoFromGallery() async {
    Navigator.pop(context);
    try{
      final imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(imageFile == null) return;

      final imageTemp = File(imageFile.path);
      setState((){
        this.imageFile = imageTemp;
      });
    } on PlatformException catch(e){
      print("failed to pick image: $e");
    }

  }
  
  displayAdminUploadFormScreen(){
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
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.purple,),onPressed: clearFormInfo,),
        title: Text("New Product",
          style: TextStyle(color: Colors.purple,
              fontSize: 24.0, fontWeight: FontWeight.bold),),
        actions: [
          FlatButton(
            onPressed: ()=> print("Clicked"),
            child: Text("Add",style: TextStyle(color: Colors.purple,
                fontSize: 16.0,fontWeight: FontWeight.bold),),
          )
        ],
      ),
      body: ListView(
        children: [
          uploading ? linearProgress() : Text(""),
          Container(
            height: 230.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Colors.black26,
                    ),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(imageFile?.path ?? "")),
                      //image: AssetImage("assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg"),
                    ),
                  ),
                  //decoration: BoxDecoration(image: DecorationImage(image: FileImage(imageFile!!),fit:BoxFit.cover )),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 12.0)),

          ListTile(
            leading: Icon(Icons.perm_device_information, color: Colors.purple,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _shortInfotextEditingController,
                decoration: InputDecoration(
                  hintText: "Short Info",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(color: Colors.purple,),

          ListTile(
            leading: Icon(Icons.perm_device_information, color: Colors.purple,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _titletextEditingController,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(color: Colors.purple,),

          ListTile(
            leading: Icon(Icons.perm_device_information, color: Colors.purple,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _descriptiontextEditingController,
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(color: Colors.purple,),

          ListTile(
            leading: Icon(Icons.perm_device_information, color: Colors.purple,),
            title: Container(
              width: 250.0,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _pricetextEditingController,
                decoration: InputDecoration(
                  hintText: "Price",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(color: Colors.purple,),

          ListTile(
            leading: Icon(Icons.perm_device_information, color: Colors.purple,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _shortInfotextEditingController,
                decoration: InputDecoration(
                  hintText: "Short Info",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(color: Colors.purple,)
        ],
      ),
    );
  }
  clearFormInfo(){

    setState((){
      //imageFile;
      imageFile = null;
      _descriptiontextEditingController.clear();
      _pricetextEditingController.clear();
      _shortInfotextEditingController.clear();
      _titletextEditingController.clear();

    });
  }
}
