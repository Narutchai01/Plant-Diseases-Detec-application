import 'dart:convert';

import 'package:capstonec/Models/DataResults.dart';
import 'package:capstonec/components/NavBar.dart';
import 'package:capstonec/components/PlantDeseaseItem.dart';
import 'package:capstonec/utils/DioInstance.dart';
import 'package:capstonec/utils/SharePreferrences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final Color backgroundColor = const Color(0xFFF0F0E5);
final Color selectedItemColor = const Color(0xFF304D30);
final Color selectedTextColor = Colors.white;
final Color highlightBorderColor = const Color(0xFF304D30);

enum SortOption { byName, byDate }

class MyPlants extends StatefulWidget {
  const MyPlants({Key? key}) : super(key: key);

  @override
  State<MyPlants> createState() => _MyPlantsState();
}

class _MyPlantsState extends State<MyPlants> {
  SortOption _sortOption = SortOption.byName;
  String? _selectedPlantName;
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

  String _sortOptionToString(SortOption option) {
    switch (option) {
      case SortOption.byName:
        return 'เรียงตามชื่อ';
      case SortOption.byDate:
        return 'เรียงตามวันเวลา';
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_dataResults.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 24.0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('My Plants'),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: highlightBorderColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                    color: selectedItemColor,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    _sortOptionToString(_sortOption),
                    style: TextStyle(
                      color: selectedTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _dataResults.length > 3 ? 4 : _dataResults.length,
            itemBuilder: (context, index) {
              final dataResult = _dataResults[index];
              final plantName =
                  dataResult.result?.diseaseId?.plant?.plantName ?? 'Unknown';
              final diseaseName =
                  dataResult.result?.diseaseId?.disease?.diseaseName ??
                      'Unknown';
              final date = dataResult.result?.createdAt;
              final resultId = dataResult.result?.id ?? 0;
              return PlantDiseaseItem(
                date: date != null
                    ? DateFormat('dd/MM/yyyy').format(date)
                    : 'Unknown',
                title: "${plantName} ${diseaseName}",
                imageUrl: dataResult?.imagesUrl?.first.imageUrl ?? '', resultId: resultId,
              );
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyPlants(),
  ));
}
