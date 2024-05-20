import 'package:flutter/material.dart';
import 'myplants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Plants App',
      home: const MyPlants(),
    );
  }
}
