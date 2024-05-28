import 'dart:convert';

import 'package:capstonec/Models/DataResultByResultID.dart';
import 'package:capstonec/components/DropDownDetails.dart';
import 'package:capstonec/utils/DioInstance.dart';
import 'package:capstonec/utils/SharePreferrences.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Result extends StatefulWidget {
  final int resultId;
  const Result({Key? key, required this.resultId}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
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
                      count: 3,
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
                  SizedBox(height: 8),
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
            if (dataResultsByResultId?.result?.diseaseId?.description != null)
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
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/grownplant.png',
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Do not found any disease',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Look like your plant is healthy.\nYou can try again by taking another photo.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
