import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    startCamera();
  }

  void startCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[1], ResolutionPreset.high);
    await controller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) => print(e));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Camera'),
        ),
        body: Stack(
          children: [
            Expanded(
              child: CameraPreview(controller),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                icon: const Icon(Icons.image_outlined, size: 50),
                onPressed: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    print(image.path);
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
                    final image = await controller.takePicture();
                    print(image.path);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}

// Future _pickerImage() async {
//   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//   setState()
// }