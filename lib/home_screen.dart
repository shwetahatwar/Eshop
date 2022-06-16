import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Home/body.dart';
import 'login-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eshop'),
        actions: [
          IconButton(onPressed: () {
            showSearch(context: context, delegate: MySearchDelegate(),);
          }, icon: const Icon(Icons.search)),

          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart))
        ],
      ),

      body: const Center( child: Text('My Page!'),

      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Eshopping'),
            ),
            ListTile(
              title: const Text('Eshop'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyProduct()));
              },
            ),
            ListTile(
              title: const Text('Buy Now'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Orders'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Favorites'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Payments'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                });
              }
            ),
          ],
        ),
      ),
    );



    // return Scaffold(
    //   body: Center(
    //     child: ElevatedButton(
    //       child: Text("Logout"),
    //       onPressed: () {
    //         FirebaseAuth.instance.signOut().then((value) {
    //           print("Signed Out");
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => MenuDrawer()));
    //         });
    //       },
    //     ),
    //   ),
    // );
  }
}

class MySearchDelegate extends SearchDelegate {

  CollectionReference _firebaseFirestore = FirebaseFirestore.instance.collection('watch');
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore.snapshots().asBroadcastStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }
        else{
          if(snapshot.data!.docs.where(
                  (QueryDocumentSnapshot<Object?> element) => element['watch']
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase())).isEmpty){
            return Center(child: Text("No search query found"),);
          }
else{
            return ListView(
              children: [
                ...snapshot.data!.docs.where(
                        (QueryDocumentSnapshot<Object?> element) => element['watch']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase())).map((QueryDocumentSnapshot<Object?> data) {
                  final String watch = data.get('watch');
                  final String color = data['grey'];
                  final String image = data['image'];

                  return ListTile(
                    // onTap: (){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(data:data)));
                    // },
                    title: Text(watch),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(image),
                    ),
                    subtitle: Text(color),
                  );
                })

              ],
            );
          }
          //print(snapshot.data);

        }
      }
    );
    // List<String> matchQuery = [];
    // for (var fruit in searchTerms) {
    //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(fruit);
    //   }
    // }
    // return ListView.builder(
    //   itemCount: matchQuery.length,
    //   itemBuilder: (context, index) {
    //     var result = matchQuery[index];
    //     return ListTile(
    //       title: Text(result),
    //     );
    //   },
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("Search anything here"));
    // List<String> matchQuery = [];
    // for (var fruit in searchTerms) {
    //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(fruit);
    //   }
    // }
    // return ListView.builder(
    //   itemCount: matchQuery.length,
    //   itemBuilder: (context, index) {
    //     var result = matchQuery[index];
    //     return ListTile(
    //       title: Text(result),
    //     );
    //   },
    // );
  }
  }