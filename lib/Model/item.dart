import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String? title;
  String? shortInfo;
  Timestamp? publishedDate;
  String? thumbnailUrl;
  String? longDescription;
  String? status;
  int? price;

  ItemModel({
     this.title,
     this.price,
    this.longDescription,
    this.publishedDate,
    this.shortInfo,
    this.status,
    this.thumbnailUrl,
});
  ItemModel.fromJson(Map<String, dynamic> json){
    title = json['title'];
    shortInfo = json['shortInfo'];
    publishedDate = json['publishedDate'];
    thumbnailUrl = json['thumbnailUrl'];
    longDescription = json['longDescription'];
    status = json['status'];
    price = json['price'];
  }
  // Map<String, dynamic> toJson() {
  //
  // }
}