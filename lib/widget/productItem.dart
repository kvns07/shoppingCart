import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jainsoft/Model/product.dart';
import '';
import '../Model/model.dart';
class ProductItem extends StatelessWidget {
  const ProductItem(
      { Key? key, this.screenSize,  this.image,this.itemName,this.price})
      : super(key: key);

  final Size? screenSize;
  final String? image, itemName;
  final int? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: screenSize!.height * 0.2,
      width: screenSize!.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.blue,
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 3)
          ]),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image!,
              height: 80,
              width: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(itemName ?? "Item"),
          ),
          Text(
            'Rs$price',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.blue,
              letterSpacing: 1.5,
              wordSpacing: 2.0,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
          Consumer<ProductsVM>(
            builder: (context, value, child) => InkWell(
              onTap: () {
                print(price);

                if(value.ls.contains(itemName)){
                  print("yy");
                  value.chng(image!,itemName!,price!);
                }
                else value.add(image!, itemName!,price!);
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                    height: screenSize!.height * 0.03,
                    width: screenSize!.width * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue),
                    child: Center(
                      child: Text(
                        "ADD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
