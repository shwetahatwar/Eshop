import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingUI extends StatelessWidget {
  const SettingUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  XFile? imageFile;
  final ImagePicker imagePicker = ImagePicker();
  bool _editFirstname = false;
  bool _editlastname = false;
  bool firstName = false;
  bool lastName = false;
  bool email = true;
  bool phoneNumber = true;
  //final urlImage = "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading:  IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16,top: 25,right: 16),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                        height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Colors.black26,
                        ),

                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:  AssetImage("assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg"),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                        right: 0,
                        child: Container(
                      height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green
                          ),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(context: context,
                                builder: ((builder) => bottomSheet()),
                              );
                            },
                            child: Icon(Icons.edit, color: Colors.white,),
                          )
                    ),),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(child: Text("Edit Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),)),
              SizedBox(
                height: 35,
              ),
              buildTextField("First name","Shweta",false, true,false , TextInputType),
              buildTextField("Last name","Hatwar",false , true, true, TextInputType),
              buildTextField("Email","Shweta@gmail.com",false, false, false , TextInputType),
              buildTextField("Phone number","+91 9766721808",false, true, false ,TextInputType.numberWithOptions()),
              buildTextField("Change password","********",true,false,false, TextInputType),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField , bool firstName, bool lastName, keyboardType){
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: firstName ? IconButton(
            onPressed: () {
              int num = 1;
                switch(num){
                  case 1 :

                    break;

                  case 2 :
                    break;

                  case 3 :
                    break;

                  default :
                    print('Number Not Found');
                }
              },
            icon: Icon(Icons.edit),
          ) : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )
        ),
      ),
    );
  }
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text("Choose Profile Photo",style: TextStyle(fontSize: 20.0),),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Center(
              child: Row(
                children: <Widget>[
                  FlatButton.icon(onPressed: () {
                    takePhoto(ImageSource.camera);
                  }, icon: Icon(Icons.camera),
                    label: Text("Camera"),),
                  FlatButton.icon(
                      icon: Icon(Icons.image),
                      onPressed: () {
                        takePhoto(ImageSource.gallery);
                      },label: Text("Gallery"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void takePhoto(ImageSource source) async {
    final pickedFile = await imagePicker.
    pickImage(source: source,);
    setState((){
      imageFile = pickedFile;
    });
  }
   // buildFileImage()
   // {
   //   Image.file(imageFile?.path);
   // }
}

