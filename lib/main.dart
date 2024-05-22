import 'package:capstonec/Routers/Routes.dart';
import 'package:capstonec/screen/Signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  runApp(const MyApp());
  // await dotenv.load(fileName: ".env");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF304D30)),
        backgroundColor: Color(0xFFF0F0E5),
        useMaterial3: true,
      ),
      home: Signup(),
      routes: Routes.routes,
    );
  }
}
