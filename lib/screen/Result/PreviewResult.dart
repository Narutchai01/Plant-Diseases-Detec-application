import 'dart:convert';

import 'package:capstonec/Models/DataResultByResultID.dart';
import 'package:capstonec/components/DropDownDetails.dart';
import 'package:capstonec/components/NavBar.dart';
import 'package:capstonec/utils/DioInstance.dart';
import 'package:capstonec/utils/SharePreferrences.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PreviewResult extends StatefulWidget {
  final int resultId;
  const PreviewResult({Key? key, required this.resultId}) : super(key: key);

  @override
  _PreviewResultState createState() => _PreviewResultState();
}

class _PreviewResultState extends State<PreviewResult> {
  final PageController _pageController = PageController();
  bool _isExpanded = false;
  DataResultsByResultId? dataResultsByResultId;
  late int resultid = 0;

  @override
  void initState() {
    super.initState();
    _isExpanded = false;
    resultid = widget.resultId;
    getData();
  }

  Future<void> getData() async {
    try {
      final token = await SharePreferrences().getToken() ?? '';
      final id = await SharePreferrences().getId() ;
      final dioInstance = DioInstance(token);
      final response = await dioInstance.dio.get('/result/$id/${resultid}');
      if (response.statusCode == 200) {
        final results =
        dataResultsByResultIdFromJson(jsonEncode(response.data));
        setState(() {
          dataResultsByResultId = results;
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void handleBacked() async {
    final token = await SharePreferrences().getToken() ?? '';
    final id = await SharePreferrences().getId();
    final dioInstance = DioInstance(token);
    try {
     final response = await dioInstance.dio.delete('/result/${id}/${resultid}');
      if (response.statusCode == 200) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Navbar(index: 0)), (route) => false,);
      } else {
        // print('Request failed with status: ${response.statusCode}');
        print('dasdasdasd');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            handleBacked();
          },
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        titleSpacing: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 280,
                  child: PageView(
                    controller: _pageController,
                    children: dataResultsByResultId?.imagesUrl?.map((url) {
                      return Image.network(
                        url.imageUrl ?? '',
                        fit: BoxFit.cover,
                      );
                    }).toList() ??
                        [],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 16,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: dataResultsByResultId?.imagesUrl?.length ?? 0,
                      effect: const ScrollingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: Color(0xFF304D30),
                        dotColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                children: [
                  Text(
                    dataResultsByResultId
                        ?.result?.diseaseId?.plant?.plantName ??
                        'Unknown',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dataResultsByResultId
                        ?.result?.diseaseId?.disease?.diseaseName ??
                        'Unknown',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            if (dataResultsByResultId?.result?.diseaseId?.description?.information?.isNotEmpty ?? false)
              ListView.builder(
                shrinkWrap: true,
                itemCount: dataResultsByResultId?.result?.diseaseId?.description?.information?.length ,
                itemBuilder: (context, index) {
                  final information = dataResultsByResultId?.result?.diseaseId?.description?.information?[index];
                  return DropDownDetails(
                    title: information?.title ?? 'Unknown',
                    detail: information?.detail ?? 'Unknown',
                    isExpanded: _isExpanded,
                  );
                },
              )
            else
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset("assets/images/grownplant.png"),
                    ),
                    const Text(
                      'Do not found any disease',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    const Text(
                      'Look like your plant is healthy.\nYou can try again by taking another photo.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Back',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      )
    );
  }
}
