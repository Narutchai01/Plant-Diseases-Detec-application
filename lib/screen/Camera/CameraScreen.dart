import 'package:capstonec/screen/Camera/PreviewImage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:capstonec/screen/Camera/ImageConfirm.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController controller;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    // Request permissions for camera and storage
    await [Permission.camera, Permission.storage].request();
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      controller = CameraController(cameras[1], ResolutionPreset.high);
      try {
        await controller.initialize();
        if (!mounted) return;
        setState(() {
          isCameraInitialized = true;
        });
      } catch (e) {
        print('Error initializing camera: $e');
      }
    } else {
      print('No cameras available');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> savePicture(XFile file) async {
    try {
      final directory = await getExternalStorageDirectory();
      final String dirPath = '${directory!.path}/Pictures';
      await Directory(dirPath).create(recursive: true);
      final String filePath = '$dirPath/${path.basename(file.path)}';
      await file.saveTo(filePath);

      // Save to gallery
      final result = await ImageGallerySaver.saveFile(filePath);
      print('Saved to gallery: $result');
    } catch (e) {
      print('Error saving picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(48, 77, 48, 1),
        title: const Text('Camera'),
      ),
      body: isCameraInitialized
          ? Stack(
        children: [
          Container(
            height: double.infinity,
            child: CameraPreview(controller),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
              icon: const Icon(Icons.image, size: 50 , color: Colors.white),
              onPressed: () async {
                try {
                  final imagePicker = ImagePicker();
                  final List<XFile>? imageFiles = await imagePicker.pickMultiImage();
                  if (imageFiles != null && imageFiles.isNotEmpty) {
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
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              icon: const Icon(Icons.circle, size: 50, color: Colors.white),
              onPressed: () async {
                try {
                  await controller.setFlashMode(FlashMode.auto);
                  XFile file = await controller.takePicture();
                  print('Picture taken: ${file.path}');
                  await savePicture(file);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewImage(imagePath: file.path, onImageSelected: (imagePath) {
                  })));
                } catch (e) {
                  print('Error taking picture: $e');
                }
              },
            ),
          ),
        ],
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}






// Future _pickerImage() async {
//   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//   setState()
// }