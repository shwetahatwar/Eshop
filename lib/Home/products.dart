import 'package:flutter/material.dart';

class Product{
  final String image,title,description;
  final int price, size , id;
  final Color color;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
});
}

List<Product> products = [
  Product(id: 1,
      image: "assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg",
      title: "ofice code",
      price: 234,
      description: "dummyText",
      size: 12,
      color: Color(0xFF3D82AE)),
  Product(id: 1,
      image: "assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg",
      title: "ofice code",
      price: 234,
      description: "dummyText",
      size: 12,
      color: Color(0xFF3D82AE)),

  Product(id: 1,
      image: "assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg",
      title: "ofice code",
      price: 234,
      description: "dummyText",
      size: 12,
      color: Color(0xFF3D82AE)),

  Product(id: 1,
      image: "assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg",
      title: "ofice code",
      price: 234,
      description: "dummyText",
      size: 12,
      color: Color(0xFF3D82AE)),
  Product(id: 1,
      image: "assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg",
      title: "ofice code",
      price: 234,
      description: "dummyText",
      size: 12,
      color: Color(0xFF3D82AE)),
  Product(id: 1,
      image: "assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg",
      title: "ofice code",
      price: 234,
      description: "dummyText",
      size: 12,
      color: Color(0xFF3D82AE)),

];