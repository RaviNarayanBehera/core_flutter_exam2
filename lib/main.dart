import 'package:core_flutter_exam2/Screens/home_page.dart';
import 'package:flutter/material.dart';

import 'Screens/detail.dart';
import 'Screens/data_entry_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => HomePage(),
        '/detail' : (context) => DetailPage(),
        '/select' : (context) => SelectDetail(),
      },
    );
  }
}


