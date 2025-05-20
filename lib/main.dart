import 'package:flutter/material.dart';
import 'package:market_app/screens/product_details_screen.dart';
import 'package:market_app/utilities/nav_bar.dart';
import 'package:market_app/widgets/dynamic_size.dart';
import 'package:market_app/widgets/testing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Market App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ProductDetailsScreen(),
    );
  }
}
