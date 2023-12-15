import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jainsoft/list.dart';
import 'package:jainsoft/Model/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsVM(),
        ),
      ],
      child: MaterialApp(
        title: 'State Management Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          hintColor: Colors.blueGrey[100],
          primaryColor: Colors.blue[200],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductScreen(),
      ),
    );
  }
}
