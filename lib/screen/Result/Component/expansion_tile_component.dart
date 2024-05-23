// expansion_tile_component.dart
import 'package:flutter/material.dart';

class MyExpansionTile extends StatelessWidget {
  final String title;
  final String content;

  const MyExpansionTile({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF304D30),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Color(0xFF304D30),
        ),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF304D30),
        collapsedIconColor: Colors.white,
        iconColor: Colors.white,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            color: Colors.white,
            child: Text(
              content,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
