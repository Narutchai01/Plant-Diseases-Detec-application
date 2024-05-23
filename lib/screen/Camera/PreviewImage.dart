import 'package:flutter/material.dart';
import 'dart:io';

class PreviewImage extends StatefulWidget {
  final String imagePath;
  final Function(String) onImageSelected;

  PreviewImage({required this.imagePath, required this.onImageSelected});

  @override
  State<StatefulWidget> createState() {
    return _PreviewImageState();
  }
}


class _PreviewImageState extends State<PreviewImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
          File(widget.imagePath),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                widget.onImageSelected(widget.imagePath);
              },
              child: const Text('Select Image'),
            ),
          ),
        ),
      ],
    );
  }
}