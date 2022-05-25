import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_web/cloud_firestore_web.dart';
class SearchService{

  searchByName(String searchField){
    return FirebaseFirestore.instance.collection('clients')
        .where('searchKey',isEqualTo: searchField.substring(0,1).toUpperCase())
        .get();
  }
}
