import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jainsoft/widget/cartItem.dart';
import 'package:jainsoft/Model/product.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();

}

class _CartScreenState extends State<CartScreen> {

  refresh() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    int total=0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This will pop the current screen off the navigation stack
          },
        ),
        title: Center(
          child: Text(
            "My Cart",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      body: Consumer<ProductsVM>(
        builder: (context, value, child) => Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: Container(
                    height: screenSize.height,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: value.lst.length ?? 3,
                      itemBuilder: (context, index) {
                        print(value.lst[index].price);
                        total+=value.lst[index].price! ;
                        return Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.horizontal,
                          background: Container(
                            color: Colors.red,
                          ),
                          onDismissed: (direction) {
                            value.del(index);
                            // total-=value.lst[index].price!;
                          },
                          child: CartItem(
                            screenSize: screenSize,
                            image: value.lst[index].image,
                            itemName: value.lst[index].name,
                            price: value.lst[index].price,
                            count:value.lst[index].count,
                            notifyParent: refresh,
                          ),
                        );
                      },
                    ),

                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  // "total",
                  'Total: Rs${value.total}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
