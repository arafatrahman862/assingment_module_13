import 'package:flutter/material.dart';
import 'ShoppingCart.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingCart(),
      debugShowCheckedModeBanner: false,
    );
  }
}