import 'dart:convert';
import 'package:capstonec/Models/DataResults.dart';
import 'package:capstonec/components/NavBar.dart';
import 'package:capstonec/components/PlantDeseaseItem.dart';
import 'package:capstonec/utils/DioInstance.dart';
import 'package:capstonec/utils/SharePreferrences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DataResults> _dataResults = [];

  @override
  void initState() {
    super.initState();
    _getResults();
  }

  Future<void> _getResults() async {
    try {
      final token = await SharePreferrences().getToken() ?? '';
      final id = await SharePreferrences().getId() ?? 0;
      final dioInstance = DioInstance(token);
      final response = await dioInstance.dio.get('/result/$id');
      if (response.statusCode == 200) {
        final results = dataResultsFromJson(jsonEncode(response.data));
        setState(() {
          _dataResults = results;
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/564x/6d/c8/49/6dc8498c0944216300538c726bef2dd6.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'My collections',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Identification of Your\n',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '\t\t\t\t\t\t\t\t\t\t\t\t\tPlant Disease\n\n',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  color: Color(0xFFF0F0E5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 16),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            _dataResults.length > 3 ? 4 : _dataResults.length,
                        itemBuilder: (context, index) {
                          final dataResult = _dataResults[index];
                          final plantName =
                              dataResult.result?.diseaseId?.plant?.plantName ??
                                  'Unknown';
                          final diseaseName = dataResult
                                  .result?.diseaseId?.disease?.diseaseName ??
                              'Unknown';
                          final date = dataResult.result!.createdAt;
                          final resultId = dataResult.result?.id ;
                          return PlantDiseaseItem(
                            date: date != null
                                ? DateFormat('dd/MM/yyyy').format(date)
                                : 'Unknown',
                            title: "${plantName} ${diseaseName}",
                            imageUrl: dataResult?.imagesUrl!.first!.imageUrl ?? '',
                            resultId: resultId!,

                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: screenWidth * 0.8,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (_dataResults.length != 0) {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Navbar(index: 3),
                                ));
                              }
                            },
                            child: const Text(
                              'See more',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Navbar(),
    );
  }
}
