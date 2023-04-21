import 'package:flutter/material.dart';
import 'package:pig_order/app_screens/pre_order/food_order.dart';

class SelectOrder extends StatelessWidget {
  const SelectOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          'เลือกรายการ',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          BoxOrder(
              name: 'อาหาร',
              imgUrl:
                  'https://s359.kapook.com/pagebuilder/cac35b94-7f07-4134-ae5d-955ca480a7f0.jpg'),
          BoxOrder(
              name: 'เครื่องดื่ม',
              imgUrl:
                  'https://th.bing.com/th/id/R.c0242674994fe51263b2a50564bbf1b8?rik=DJHOq1bYP0t%2fiw&riu=http%3a%2f%2fwww.smeleader.com%2fwp-content%2fuploads%2f2015%2f03%2f%e0%b8%82%e0%b8%b2%e0%b8%a2%e0%b8%99%e0%b9%89%e0%b8%b3%e0%b8%ad%e0%b8%b1%e0%b8%94%e0%b8%a5%e0%b8%a1-INNERGY-%e0%b9%81%e0%b8%88%e0%b9%89%e0%b8%87%e0%b9%80%e0%b8%81%e0%b8%b4%e0%b8%94%e0%b8%99%e0%b9%89%e0%b8%b3%e0%b8%ad%e0%b8%b1%e0%b8%94%e0%b8%a5%e0%b8%a1%e0%b9%81%e0%b8%99%e0%b8%a7%e0%b9%83%e0%b8%ab%e0%b8%a1%e0%b9%88-%e0%b8%ab%e0%b8%a7%e0%b8%b2%e0%b8%99%e0%b8%8b%e0%b9%88%e0%b8%b2-%e0%b8%8a%e0%b8%b7%e0%b9%88%e0%b8%99%e0%b9%83%e0%b8%88-%e0%b9%83%e0%b8%aa%e0%b9%88%e0%b9%83%e0%b8%88%e0%b8%aa%e0%b8%b8%e0%b8%82%e0%b8%a0%e0%b8%b2%e0%b8%9e-3.jpg&ehk=9Cf1%2fw73F0fHJZRpvbnphV9zBwbgqJqUT46KFm4iar4%3d&risl=&pid=ImgRaw&r=0'),
        ],
      )),
    ));
  }
}

class BoxOrder extends StatelessWidget {
  const BoxOrder({
    Key? key,
    required this.name,
    required this.imgUrl,
  }) : super(key: key);

  final String name;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => const FoodOrder())),
      child: SizedBox(
        child: Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.pinkAccent,
                  decoration: TextDecoration.underline),
            ),
            Container(
              height: 250,
              width: 370,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(imgUrl)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
