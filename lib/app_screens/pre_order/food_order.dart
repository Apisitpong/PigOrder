import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../check_bill/sum_order.dart';
import '../provider/store.dart';

class FoodOrder extends StatefulWidget {
  const FoodOrder({Key? key}) : super(key: key);

  @override
  State<FoodOrder> createState() => _FoodOrderState();
}

class _FoodOrderState extends State<FoodOrder> {
  List dataFood = [
    {
      'name': 'ข้าวผัด',
      'price': '89 ',
      'imgUrl':
          'https://almocooking.com/wp-content/uploads/2019/11/%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B9%80%E0%B8%97%E0%B8%A8%E0%B8%88%E0%B8%B5%E0%B8%994.jpg',
      'count': 0,
      'sum': 0,
    },
    {
      'name': 'กะเพรา',
      'price': '89 ',
      'imgUrl':
          'https://th.bing.com/th/id/OIP.tTiamxp7Z_aRrvQSXx8HtgHaHa?w=166&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      'count': 0,
      'sum': 0,
    },
    {
      'name': 'ต้มยำ',
      'price': '189 ',
      'imgUrl':
          'https://i.pinimg.com/originals/83/51/03/8351031ee9f67bd7f119c77af22f80b0.png',
      'count': 0,
      'sum': 0,
    },
    {
      'name': 'ผัดผงกะหรี่',
      'price': '129 ',
      'imgUrl':
          'https://pstip.cc/upload/media/entries/2022-05/28/4918-entry-2-1653746065.jpg',
      'count': 0,
      'sum': 0,
    },
    {
      'name': 'ยำ',
      'price': '109 ',
      'imgUrl':
          'https://th.bing.com/th/id/OIP.RK-pYR4lof_HkDJbpze--QHaE8?pid=ImgDet&rs=1',
      'count': 0,
      'sum': 0,
    },
    {
      'name': 'เอ็นไก่ทอด',
      'price': '79 ',
      'imgUrl': 'https://img.kapook.com/u/surauch/movie4/EN00.jpg',
      'count': 0,
      'sum': 0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    int? sumAll = 0;
    var provider = context.watch<Store>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'เลือกรายการอาหาร',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.93,
              shrinkWrap: true,
              children: List.generate(dataFood.length, (index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          dataFood[index]['name'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          dataFood[index]['price'] + '฿',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 130,
                        width: 180,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(dataFood[index]['imgUrl']),
                                fit: BoxFit.cover),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              provider.remove(dataFood[index]);
                              setState(() {
                                dataFood[index]['count'] = provider.count;
                                dataFood[index]['sum'] = provider.sum;
                                sumAll = 0;
                                for (int i = 0; i < dataFood.length; i++) {
                                  sumAll =
                                      (sumAll! + dataFood[i]['sum']) as int?;
                                  provider.res(sumAll);
                                }
                              });
                            },
                            icon: const Icon(Icons.remove)),
                        Text(
                          dataFood[index]['count'].toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        IconButton(
                            onPressed: () {
                              provider.add(dataFood[index]);
                              setState(() {
                                dataFood[index]['count'] = provider.count;
                                dataFood[index]['sum'] = provider.sum;
                                sumAll = 0;
                                for (int i = 0; i < dataFood.length; i++) {
                                  sumAll =
                                      (sumAll! + dataFood[i]['sum']) as int?;
                                  provider.res(sumAll);
                                }
                              });
                            },
                            icon: const Icon(Icons.add)),
                      ],
                    ),
                  ],
                );
              }),
            ),
            Text(
              provider.sumAll.toString(),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),

            // const SizedBox(
            //   height: 12,
            // ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("รายการอาหารที่สั่ง"),
                      content: Text(
                        'ราคา  ${provider.sumAll}   บาท',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text(
                                  "cancel",
                                  style: TextStyle(color: Colors.red),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const SumOrder()));
                                },
                                child: const Text(
                                  "okay",
                                  style: TextStyle(color: Colors.green),
                                )),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'ยืนยันรายการอาหาร',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
