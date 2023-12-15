import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jainsoft/Model/product.dart';
import 'package:provider/provider.dart';
import 'package:jainsoft/cart.dart';
class CartItem extends StatefulWidget {
  const CartItem(
      {Key? key, @required this.screenSize, this.image, this.itemName, this.del,this.price,this.count
      ,this.notifyParent})
      : super(key: key);
  final Size? screenSize;
  final Function()? notifyParent;
  final String? image, itemName;
  final Function? del;
  final int? price;
  final int? count;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // final Size? screenSize=CartItem.screenSize;
  // final String? image, itemName;
  // final Function? del;
  // final int? price;
  // final int? count;
  @override
  Widget build(BuildContext context) {
    // int count=1;
    return Container(
      margin: EdgeInsets.all(10),
      height: widget.screenSize!.height * 0.15,
      width: widget.screenSize!.width,
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.image!,
                height: 80,
                width: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                widget.itemName ?? "Item",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Text(
              'Rs${widget.price}',
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
            Text(
              'No:${widget.count}',
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
          ]),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Consumer<ProductsVM>(
                    builder: (context, value, child) => InkWell(
                      onTap: () {
                        print(widget.price);

                        if(value.ls.contains(widget.itemName)){
                          print("yy");
                          value.chng(widget.image!,widget.itemName!,widget.price!);
                        }
                        else value.add(widget.image!, widget.itemName!,widget.price!);
                        widget.notifyParent!();
                        // fun();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                            height: widget.screenSize!.height * 0.03,
                            width: widget.screenSize!.width * 0.15,
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
                ),
                Consumer<ProductsVM>(
                  builder: (context, value, child) => InkWell(
                    onTap: () {
                      if(value.ls.contains(widget.itemName)){
                        print("zz");
                        value.dchng(widget.image!,widget.itemName!,widget.price!);
                      }
                      widget.notifyParent!();
                      // cart.fun();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                          height: widget.screenSize!.height * 0.03,
                          width: widget.screenSize!.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue),
                          child: Center(
                            child: Text(
                              "REMOVE",
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
          )
        ],
      ),
    );
  }
}

// class CartItem extends StatefulWidget {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     // int count=1;
//     return Container(
//       margin: EdgeInsets.all(10),
//       height: screenSize!.height * 0.15,
//       width: screenSize!.width,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.blue,
//                 offset: Offset(0, 0),
//                 blurRadius: 3,
//                 spreadRadius: 3)
//           ]),
//       child: Column(
//         children: [
//           Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Image.asset(
//                 image!,
//                 height: 80,
//                 width: 80,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: Text(
//                 itemName ?? "Item",
//                 style: TextStyle(fontSize: 22),
//               ),
//             ),
//             Text(
//               'Rs$price',
//               style: TextStyle(
//                 fontSize: 15.0,
//                 fontWeight: FontWeight.bold,
//                 fontStyle: FontStyle.italic,
//                 color: Colors.blue,
//                 letterSpacing: 1.5,
//                 wordSpacing: 2.0,
//                 textBaseline: TextBaseline.alphabetic,
//               ),
//             ),
//             Text(
//               'No:$count',
//               style: TextStyle(
//                 fontSize: 15.0,
//                 fontWeight: FontWeight.bold,
//                 fontStyle: FontStyle.italic,
//                 color: Colors.blue,
//                 letterSpacing: 1.5,
//                 wordSpacing: 2.0,
//                 textBaseline: TextBaseline.alphabetic,
//               ),
//             ),
//           ]),
//           Center(
//             child: Consumer<ProductsVM>(
//               builder: (context, value, child) => InkWell(
//                 onTap: () {
//                   print(price);
//
//                   if(value.ls.contains(itemName)){
//                     print("yy");
//                     value.chng(image!,itemName!,price!);
//                   }
//                   else value.add(image!, itemName!,price!);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Container(
//                       height: screenSize!.height * 0.03,
//                       width: screenSize!.width * 0.15,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: Colors.blue),
//                       child: Center(
//                         child: Text(
//                           "ADD",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       )),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
