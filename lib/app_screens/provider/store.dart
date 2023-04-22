import 'package:flutter/material.dart';

class Store extends ChangeNotifier {
  //String connect = 'connected';
  int count = 0;
  int sum = 0;
  int sumAll = 0;
  List orderSum = [];

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

  void sumPrice(sum) {
    sumAll = sum;
    notifyListeners();
  }

  void sumOrder(dataFood) {
    int id = orderSum.length;
    print(orderSum.length);
    orderSum.add([
      {'id': id,'count':0},
      dataFood
    ]);
    addOrder(0, 'dataFood');
    notifyListeners();
  }

  void addOrder(int id, String order) {
    List dataFood = [];

    order == 'dataFood'
        ? {
            orderSum[id][1]
                .map((e) => {dataFood.add(e), print('e : ${e['name']}')})
                .toList()
                .toString(),
          }
        : print(orderSum[id][0][order]);
    print(orderSum);
    print(orderSum[0][1]);
    print(orderSum[0][1].where((element) => element.count > 0).toList());

    notifyListeners();
  }
}
