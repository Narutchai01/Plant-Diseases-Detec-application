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
    if (controller.value.isInitialized){
      return Scaffold(
        body: Stack(
          children: [

            CameraPreview(controller),
           Align(
              alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
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
           Align(
             alignment: Alignment.bottomLeft,
              child: IconButton(
                icon: const Icon(Icons.image_outlined),
                onPressed: () async {
                },
              ),
           ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                icon: const Icon(Icons.circle_outlined),
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