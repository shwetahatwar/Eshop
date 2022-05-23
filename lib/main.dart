import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
	 WidgetsFlutterBinding.ensureInitialized();
	 await Firebase.initializeApp( 	options: const FirebaseOptions(
			appId: 'my_appId',
			apiKey: 'my_apiKey',
			messagingSenderId: 'my_messagingSenderId',
			projectId: 'my_projectId'
	));
   runApp(MyApp());
}


// void main() async {
// 	WidgetsFlutterBinding.ensureInitialized();
// 	options: const FirebaseOptions(
// 			appId: 'my_appId',
// 			apiKey: 'my_apiKey',
// 			messagingSenderId: 'my_messagingSenderId',
// 			projectId: 'my_projectId'
// 	);
// 	runApp(MyApp());
// }
class MyApp extends StatelessWidget {

// This widget is the root of your application.
@override
Widget build(BuildContext context) {

	return MaterialApp(
	debugShowCheckedModeBanner: false,
		
	// Title of App
	title: 'GFG slider',
	theme: ThemeData(
		primaryColor: Color.fromARGB(111, 111, 111, 111)
	),

		
	//First Screen of Slider App
	home: HomePage(),
	 // routes: {
		//  '/Login': (context) => const Login(),
	 // },
   // routes: <String, WidgetBuilder>{
   //      '/login': (BuildContext context) => new Login(),
   //    }
	);
}
}
