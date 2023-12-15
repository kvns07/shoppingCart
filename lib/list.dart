import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jainsoft/cart.dart';
import 'package:jainsoft/widget/cartCounter.dart';
import 'package:jainsoft/widget/productItem.dart';
import 'package:jainsoft/Model/product.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Padding(
              padding:
              const EdgeInsets.only(left: 0, right: 15, top: 8, bottom: 8),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(Icons.shopping_cart_rounded,
                          color: Colors.blue, size: 25)),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Consumer<ProductsVM>(
                      builder: (context, value, child) => CartCounter(
                        count: value.lst.length.toString(), key: null,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.menu_rounded, color: Colors.blue, size: 25),
        ),
        title: Center(
          child: Text(
            "My Mart",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: screenSize.height * 0.24,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: prds.length,
                itemBuilder: (context, index) => ProductItem(
                  screenSize: screenSize,
                  image: prds[index]["image"].toString(),
                  itemName: prds[index]["name"].toString(),
                  price: cost[index],
                ),
              ),
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: _currentIndex,
        // onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
final cost=[100000,30000,63000,10000,400000,100000,100000];
final prds = [
  {
    "name": "Iphone 14",
    "image":
    "assets/iphone.jpg",
    "price":100000
  },
  {
    "name": "Oneplus 10R",
    "image":
    "assets/oneplus.jpg",
    "price":100000
  },
  {
    "name": "Samsung s23",
    "image":
    "assets/samsung.jpg",
    "price":100000
  },
  {
    "name": "Oppo",
    "image":
    "assets/iphone.jpg",
    "price":100000
  },
  {
    "name": "Vivo",
    "image":
    "assets/iphone.jpg",
    "price":100000
  },
  {
    "name": "Galaxy",
    "image":
    "assets/iphone.jpg",
    "price":100000
  },
];
