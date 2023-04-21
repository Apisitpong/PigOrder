import 'package:flutter/material.dart';

class FoodOrder extends StatefulWidget {
  const FoodOrder({Key? key}) : super(key: key);

  @override
  State<FoodOrder> createState() => _FoodOrderState();
}

class _FoodOrderState extends State<FoodOrder> {
  List dataFood = [
    {
      'name': 'ข้าวผัด',
      'price': '89 ฿',
      'imgUrl':
          'https://almocooking.com/wp-content/uploads/2019/11/%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B9%80%E0%B8%97%E0%B8%A8%E0%B8%88%E0%B8%B5%E0%B8%994.jpg'
    },
    {
      'name': 'กะเพรา',
      'price': '89 ฿',
      'imgUrl':
          'https://th.bing.com/th/id/OIP.tTiamxp7Z_aRrvQSXx8HtgHaHa?w=166&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'
    },
    {
      'name': 'ต้มยำ',
      'price': '189 ฿',
      'imgUrl':
          'https://i.pinimg.com/originals/83/51/03/8351031ee9f67bd7f119c77af22f80b0.png'
    },
    {
      'name': 'ผัดผงกะหรี่',
      'price': '129 ฿',
      'imgUrl':
          'https://pstip.cc/upload/media/entries/2022-05/28/4918-entry-2-1653746065.jpg'
    },
    {
      'name': 'ยำ',
      'price': '109 ฿',
      'imgUrl':
          'https://th.bing.com/th/id/OIP.RK-pYR4lof_HkDJbpze--QHaE8?pid=ImgDet&rs=1'
    },
    {
      'name': 'เอ็นไก่ทอด',
      'price': '79 ฿',
      'imgUrl':
          'https://img.kapook.com/u/surauch/movie4/EN00.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
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
              height: 10,
            ),
            const Text(
              'อาหาร',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              crossAxisCount: 2,
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
                          dataFood[index]['price'],
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
                    const Text(
                      '-  0  +',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent),
                onPressed: () {},
                child: const Text(
                  'ยืนยันรายการอาหาร',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
