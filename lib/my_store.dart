import 'package:flutter/material.dart';

import 'Home/products.dart';

class MyStore extends ChangeNotifier{
  List<Product> _products = [];
  List<Product> _baskets = [];
  Product? _activeProduct = null;

  MyStore(){
    _products = [
      Product(id: 1,
          image: "assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg",
          title: "ofice code",
          price: 234,
          description: "dummyText",
          size: 12,
          color: Color(0xFF3D82AE)),
      Product(id: 2,
          image: "assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg",
          title: "ofice code",
          price: 234,
          description: "dummyText",
          size: 12,
          color: Color(0xFF3D82AE)),

      Product(id: 3,
          image: "assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg",
          title: "ofice code",
          price: 234,
          description: "dummyText",
          size: 12,
          color: Color(0xFF3D82AE)),

      Product(id: 4,
          image: "assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg",
          title: "ofice code",
          price: 234,
          description: "dummyText",
          size: 12,
          color: Color(0xFF3D82AE)),
      Product(id: 5,
          image: "assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg",
          title: "ofice code",
          price: 234,
          description: "dummyText",
          size: 12,
          color: Color(0xFF3D82AE)),
      Product(id: 6,
          image: "assets/images/becca-mchaffie-Fzde_6ITjkw-unsplash.jpg",
          title: "ofice code",
          price: 234,
          description: "dummyText",
          size: 12,
          color: Color(0xFF3D82AE)),
    ];
    notifyListeners();
  }

  List<Product> get products => _products;
  List<Product> get baskets => _baskets;
  Product? get activeProduct => _activeProduct;

  do1(){
    _products[0].id.toString().isNotEmpty;
  }

  setActiveProduct(Product p){
    _activeProduct = p;
  }
}