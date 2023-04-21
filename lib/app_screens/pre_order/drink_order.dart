import 'package:flutter/material.dart';

class DrinkOrder extends StatefulWidget {
  const DrinkOrder({Key? key}) : super(key: key);

  @override
  State<DrinkOrder> createState() => _DrinkOrderState();
}

class _DrinkOrderState extends State<DrinkOrder> {
  List dataFood = [
    {
      'name': 'น้ำแข็ง',
      'price': '39 ฿',
      'imgUrl':
          'https://www.khaosod.co.th/wpapp/uploads/2021/05/%E0%B8%84%E0%B8%A5%E0%B8%B1%E0%B8%AA%E0%B9%80%E0%B8%95%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B8%99%E0%B9%89%E0%B8%B3%E0%B9%81%E0%B8%82%E0%B9%87%E0%B8%87.jpg'
    },
    {
      'name': 'น้ำเปล่า',
      'price': '19 ฿',
      'imgUrl':
          'https://newmonrakphokha.weebly.com/uploads/1/2/0/0/120009135/55_orig.jpg'
    },
    {
      'name': 'โค้ก',
      'price': '29 ฿',
      'imgUrl':
          'https://th.bing.com/th/id/OIP.EwNQLhpDfQb49QSl9gPnHQHaHa?pid=ImgDet&rs=1'
    },
    {
      'name': 'เบียร์สิงห์',
      'price': '79 ฿',
      'imgUrl':
          'https://th.bing.com/th/id/R.f07c4957dca6cf44846f53539f63ae5d?rik=oZjSy0BQKSEwnQ&riu=http%3a%2f%2fwww.singhapattanachiangmai.com%2fwp-content%2fuploads%2f2016%2f02%2fsingha_500.jpg&ehk=oTM%2bsQMW%2fZMKbwOOFLqi2vdz24zlqFdAybx3v723yeQ%3d&risl=&pid=ImgRaw&r=0'
    },
    {
      'name': 'เบียร์ลีโอ',
      'price': '69 ฿',
      'imgUrl':
          'https://amazingoriental.com/wp-content/uploads/2021/03/69432_01_416px.png'
    },
    {
      'name': 'โซดา',
      'price': '19 ฿',
      'imgUrl':
          'https://th.bing.com/th/id/R.b8b50c29bbca79b8106871eb42b80237?rik=y0WyM3pxNXcFVA&riu=http%3a%2f%2fwww.singhapattanachiangmai.com%2fwp-content%2fuploads%2f2017%2f07%2f%e0%b9%82%e0%b8%8b%e0%b8%94%e0%b8%b2%e0%b8%aa%e0%b8%b4%e0%b8%87%e0%b8%ab%e0%b9%8c.jpg&ehk=kq6iPfbnWQxAELlYlfeQqeJG0Oqh2XFvR3BPC5Luamg%3d&risl=&pid=ImgRaw&r=0'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'เลือกรายการเครื่องดื่ม',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.remove)),
                        const Text(
                          '0',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                      ],
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
              width: 220,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent),
                onPressed: () {},
                child: const Text(
                  'ยืนยันรายการเครื่องดื่ม',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
