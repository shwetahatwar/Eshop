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
    thumbnailUrl = json['thumbnailUrl'] ;
    longDescription = json['longDescription'];
    status = json['status'];
    price = json['price'];
    //return ItemModel(title: title, shortInfo: shortInfo,publishedDate: publishedDate,thumbnailUrl: thumbnailUrl,longDescription: longDescription,status: status,price: price);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic> ();
    data["title"] =  this.title;
    data["shortInfo"] = this.shortInfo;
    data["publishedDate"] = this.publishedDate;
    data["thumbnailUrl"] = this.thumbnailUrl;
    data["longDescription"] = this.longDescription;
    data["status"] = this.status;
    data["price"] = this.price;
    return data;
  }
  
}