import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/admin/authentication.dart';
import 'package:eshop/admin/uploadItems.dart';
import 'package:eshop/login-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Home/storehome.dart';
import '../reusable_widgets/reusable_widgets.dart';

class AdminSignInPage extends StatelessWidget {
  const AdminSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          style: TextStyle(fontSize: 55.0, color: Colors.white,fontFamily: "CharisSIL-Regular"),
        ),
        centerTitle: true,
      ),
      body:  AdminSignInScreen(),
    );
  }
}

class AdminSignInScreen extends StatefulWidget {
  const AdminSignInScreen({Key? key}) : super(key: key);

  @override
  State<AdminSignInScreen> createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _adminIDTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
   late String? query;
   final _auth = FirebaseAuth.instance;
   //final dbRef = FirebaseFirestore.instance.("admins");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(
            20, MediaQuery
            .of(context)
            .size
            .height * 0.2, 20, 0),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.pink, Colors.lightGreenAccent],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          children: <Widget>[
            logoWidget("assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg"),
            const SizedBox(
              height: 30,
            ),
            reusableTextField("Enter UserName", Icons.person_outline, false,
                _adminIDTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Enter Password", Icons.lock_outline, true,
                _passwordTextController),
            const SizedBox(
              height: 5,
            ),
            //forgetPassword(context),
            RaisedButton(
              onPressed: () {
                _adminIDTextController.text.isNotEmpty &&
                    _passwordTextController.text.isNotEmpty
                    ? loginAdmin()
                    : showDialog(
                    context: context,
                    builder: (c) {
                      return Text("please write email & password");
                    });
              },
              color: Colors.purple,
              child: Text("Login", style: TextStyle(color: Colors.white),),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              height: 4.0,
              width: 0.8,
              color: Colors.purple,
            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton.icon(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => AuthenticScreen())),
              icon: (Icon(Icons.nature_people, color: Colors.purple,)),
              label: Text("i'm not Admin", style: TextStyle(
                  color: Colors.purple, fontWeight: FontWeight.bold),),)
            // firebaseUIButton(context, "Sign In", () {
            //   FirebaseAuth.instance
            //       .signInWithEmailAndPassword(
            //       email: _adminIDTextController.text,
            //       password: _passwordTextController.text)
            //       .then((value) {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => StoreHome()));
            //   }).onError((error, stackTrace) {
            //     print("Error ${error.toString()}");
            //   });
            // }),

            // FlatButton.icon(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> AuthenticScreen())),
            //     icon: (Icon(Icons.nature_people, color: Colors.pink,)),
            //     label: Text("i'm not admin",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),))
            // signUpOption()
          ],
        ),
      ),
    );
  }

  loginAdmin() async {
   try{
     final newUser = await _auth.
     signInWithEmailAndPassword(email: _adminIDTextController.text, password: _passwordTextController.text);

     if(newUser != null){
       print("Success");
       Route route = MaterialPageRoute(builder: (c) => UploadPage());
       Navigator.pushReplacement(context, route);
     }
     else{
       print("fail");
     }
   } catch (e) {
     print(e);
   }
  }
}

  // loginAdmin(){
  //   FirebaseFirestore.instance.collection("admins").getDocuments().then((snapshot){
  //     snapshot.documents.forEach((result){
  //       if(result.data["id"] != _adminIDTextController.text.trim()){
  //         Scaffold.of(context).showSnackBar(SnackBar(content: Text("your id is not correct")));
  //       }
  //       else if(result.data["password"] != _passwordTextController.text.trim()){
  //         Scaffold.of(context).showSnackBar(SnackBar(content: Text("your password is not correct"),));
  //       }
  //       else{
  //         Scaffold.of(context).showSnackBar(SnackBar(content: Text("Welcome Admin," + result.data["name"]),));
  //
  //         setState((){
  //           _adminIDTextController.text = "";
  //           _passwordTextController.text = "";
  //         });
  //
  //         Route route = MaterialPageRoute(builder: (c) => UploadPage());
  //         Navigator.pushReplacement(context, route);
  //
  //       }
  //     });
  //   });
  // }
