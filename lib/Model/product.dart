import 'package:flutter/widgets.dart';
import 'package:jainsoft/Model/model.dart';

class ProductsVM with ChangeNotifier {
  List<Products> lst =[];
  int total=0;
  List<String> ls=[];
  add(String image, String name,int price) {
    print(price);
    ls.add(name);
    total+=price;
    lst.add(Products(image: image, name: name,price: price,count:1));
    notifyListeners();
  }
  chng(String image, String n,int price){
    for(int i=0;i<lst.length;i++){
      print(lst[i].count);
      if(lst[i].name==n) lst[i].count=lst[i].count+1;
    }
    print(total);
    total+=price;
    print(total);
  }
  dchng(String image, String n,int price){
    for(int i=0;i<lst.length;i++){
      print(lst[i].count);
      if(lst[i].name==n&&lst[i].count>1){
        lst[i].count=lst[i].count-1;
        total-=price;
        break;
      }
    }
    print(total);

    print(total);
  }
  del(int index) {
    total-=lst[index].price!*lst[index].count;
    lst.removeAt(index);
    ls.removeAt(index);
    notifyListeners();
  }
}
