import 'package:flutter/material.dart';

class CartItemCounter extends ChangeNotifier{
  int? _counter;
  int? get count => _counter;
}