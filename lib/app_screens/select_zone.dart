import 'package:flutter/material.dart';
import 'package:pig_order/app_screens/pre_order/select_order.dart';

class SelectZone extends StatefulWidget {
  const SelectZone({Key? key}) : super(key: key);

  @override
  State<SelectZone> createState() => _SelectZoneState();
}

class _SelectZoneState extends State<SelectZone> {
  List numTable = [
    {'number': 'โต๊ะ 1'},
    {'number': 'โต๊ะ 2'},
    {'number': 'โต๊ะ 3'},
    {'number': 'โต๊ะ 4'},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'โซน A',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(80),
              color: Colors.blue,
            ),
            // const SizedBox(
            //   height: 60,
            // ),
            Expanded(
              child: ListView.builder(
                  itemCount: numTable.length,
                  itemBuilder: (context, index) =>
                      ButtonTable(numTable: numTable, index: index)),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ListView.builder(
            //         itemCount: numT.length,
            //         itemBuilder: (context, index) =>
            //             buttonTable(numTable: numT, index: index))
            //   ],
            // ),
            // const SizedBox(
            //   height: 60,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     buttonTable('โต๊ะ 3'),
            //     buttonTable('โต๊ะ 4'),
            //   ],
            // ),
          ],
        ),
      ),
    ));
  }
}

class ButtonTable extends StatelessWidget {
  const ButtonTable({
    Key? key,
    required this.numTable,
    required this.index,
  }) : super(key: key);

  final  numTable;
  final  index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => const SelectOrder())),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.green, width: 8)),
          child: Center(
              child: Text(
            numTable[index]['number'],
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          )),
        ),
      ),
    );
  }
}
