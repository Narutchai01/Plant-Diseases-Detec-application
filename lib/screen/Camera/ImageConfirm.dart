import 'dart:io';



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerConfirm extends StatefulWidget {
  const ImagePickerConfirm(this.selectedImages, {Key? key}) : super(key: key);

  final List<XFile> selectedImages;

  @override
  State<ImagePickerConfirm> createState() => _ImagePickerConfirmState();
}

class _ImagePickerConfirmState extends State<ImagePickerConfirm> {
  final TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: const Text('Confirm Images'),
        backgroundColor: const Color.fromRGBO(48, 72, 48, 1),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Selected',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: widget.selectedImages.length,
              itemBuilder: (context, index) {
                return Image.file(File(widget.selectedImages[index].path));
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  print('Confirmation Button Pressed!');
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 30.0), // Adjust size here
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}