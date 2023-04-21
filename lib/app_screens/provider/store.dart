import 'package:flutter/material.dart';

class Store extends ChangeNotifier{
  //String connect = 'connected';
  int count = 0;

  void add(index){
    count = index;
    count++;
    notifyListeners();
  }
  void remove(index){
    if(count > 0){
      count--;
    }
    notifyListeners();
  }
}