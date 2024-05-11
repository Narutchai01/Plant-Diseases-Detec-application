import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        backgroundColor: Color.fromARGB(255, 165, 214, 194),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 64, 175, 106),
          title: Text("HomePage"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 300),
                Text("Hi!! Fluke this is your Homepage na"),
                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: Text("From Poom"),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
