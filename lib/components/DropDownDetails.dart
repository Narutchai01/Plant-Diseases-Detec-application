import 'package:flutter/material.dart';

class DropDownDetails extends StatefulWidget {
  final String title;
  final String detail;
  bool isExpanded;

  DropDownDetails({Key? key, required this.title, required this.detail, this.isExpanded = false}) : super(key: key);

  @override
  _DropDownDetailsState createState() => _DropDownDetailsState();
}

class _DropDownDetailsState extends State<DropDownDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF304D30),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Color(0xFF304D30),
          ),
        ),
        child: ExpansionTile(
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xFF304D30),
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
          initiallyExpanded: widget.isExpanded,
          trailing: Icon(
            widget.isExpanded
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          onExpansionChanged: (value) {
            setState(() {
              widget.isExpanded = value;
            });
          },
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 12.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.detail,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}