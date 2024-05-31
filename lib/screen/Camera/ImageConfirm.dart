import 'dart:io';


import 'package:capstonec/screen/Camera/PreviewImage.dart';
import 'package:capstonec/screen/Result/PreviewResult.dart';
import 'package:capstonec/screen/Result/Result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/SharePreferrences.dart';


class ImagePickerConfirm extends StatefulWidget {
  const ImagePickerConfirm(this.selectedImages, {Key? key}) : super(key: key);

  final List<XFile> selectedImages;

  @override
  State<ImagePickerConfirm> createState() => _ImagePickerConfirmState();
}

class _ImagePickerConfirmState extends State<ImagePickerConfirm> {


  void handleSubmitted() async{
    FormData formData = FormData.fromMap({
      'images': [],
    });
    for (var file in widget.selectedImages) {
      formData.files.add(MapEntry(
        'images',
        await MultipartFile.fromFile(file.path),
      ));
    }
    final token = await SharePreferrences().getToken() ?? '';
    final id = await SharePreferrences().getId();
     Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    try {
     final resonse = await dio.post(
        'http://localhost:3000/result/$id',
        data: formData,
        options: Options(
          headers: {
            'x-jwt-token': token,
          },
        ),
      );
      if (resonse.statusCode == 200) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PreviewResult(resultId: resonse.data['id']), ), (route) => false,);
      } else {
        print('Request failed with status:');
      }
    } catch (e) {
      print('Error:');
    }
  }


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
                  handleSubmitted();
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(48, 77, 48, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}