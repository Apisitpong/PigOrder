import 'package:flutter/material.dart';

import 'app_screens/check_bill/sum_order.dart';
import 'app_screens/pre_order/drink_order.dart';
import 'app_screens/pre_order/food_order.dart';
import 'app_screens/pre_order/select_order.dart';
import 'app_screens/provider/store.dart';
import 'app_screens/select_zone.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: ((context) => Store()),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SelectZone(),
    );
  }
}
