import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:capstonec/screen/Camera/ImageConfirm.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Image'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: go_back,
        ),
      ),
      body: Stack(
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
                  try {

                    List<XFile> imageFiles = [XFile(widget.imagePath)];
                    if (imageFiles != null && imageFiles.isNotEmpty) {
                      // Navigate to ImagePickerConfirm and clear the navigation stack
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (ImagePickerConfirm(
                              imageFiles
                          )

                          ),
                        ),
                            (route) => true,
                      );
                    }
                  } catch (e) {
                    print('Error picking images: $e');
                  }
                },
                child: const Text('Select Image'),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> go_back() async {
    Navigator.pop(context);
  }
}