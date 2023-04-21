import 'package:flutter/material.dart';

class Store extends ChangeNotifier {
  //String connect = 'connected';
  int count = 0;
  int sum = 0;
  int sumAll = 0;

  void add(index) {
    count = index['count'];
    if (count >= 0) {
      count++;
      sum = count * int.parse(index['price']);
      print(sum);
    }
    notifyListeners();
  }

  void remove(index) {
    count = index['count'];
    if (count > 0) {
      count--;
      sum = count * int.parse(index['price']);
      print(sum);
    }
    notifyListeners();
  }

  void sumOrder(List foods) {
    // sum = count *;
    notifyListeners();
  }

  void res(sum) {
    sumAll = sum;
    notifyListeners();
  }
  void addOrder(dataFood){

  }
}
