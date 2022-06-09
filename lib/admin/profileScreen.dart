import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Home/storehome.dart';

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

  String firstName = "Shweta";
  String lastName = "Chopkar";
  String email = "shweta@gmail.com";
  String phoneNumber = "+91 9999923321";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(
            color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),),
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Route route = MaterialPageRoute(builder: (c) => StoreHome());
            Navigator.pushReplacement(context, route);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
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
                          //image: File(imageFile.path) = null ? : ;
                          image: AssetImage("assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg"),
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
                                color: Theme
                                    .of(context)
                                    .scaffoldBackgroundColor,
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
              Center(child: Text("Edit Profile",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,),)),
              SizedBox(
                height: 35,
              ),
              buildTextField("First name", TextEditingController(text: firstName),false , IconButton(onPressed: (){}, icon: const Icon(Icons.edit))),
              buildTextField("Last name", TextEditingController(text: lastName),false , IconButton(onPressed: (){}, icon: const Icon(Icons.edit))),
              buildTextField("Email", TextEditingController(text: email),false , null),
              buildTextField("Phone number", TextEditingController(text: phoneNumber),false , null),
              buildTextField("Change password",null,true , IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_right))),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextField(String labelText, TextEditingController? controller , bool isPasswordTextField, IconButton? suffixIcon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
        ),
        controller: TextEditingController(text: labelText),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text("Choose Profile Photo", style: TextStyle(fontSize: 20.0),),
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
                      }, label: Text("Gallery"))
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
    pickImage(source: source);
    setState(() {
      imageFile = pickedFile;
    });
  }

  // buildFileImage()
  // {
  //   Image.file(imageFile?.path);
  // }

  // _editTitleTextField() {
  //   setState(() {
  //     _isEditingText = true;
  //   });
  // }
}
