import 'package:flutter/material.dart';
import 'home.dart'; // เพิ่มการ import ไฟล์ home.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: HomePage(), // เปลี่ยนจาก Scaffold เป็น HomePage()
    );
  }
}
