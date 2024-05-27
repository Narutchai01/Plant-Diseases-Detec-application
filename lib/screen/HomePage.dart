import 'dart:convert';
import 'package:capstonec/Models/DataResults.dart';
import 'package:capstonec/components/PlantDeseaseItem.dart';
import 'package:capstonec/Model/Model.dart';
import 'package:capstonec/components/NavBar.dart';
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

 final List<DataResults> dataResults = [] ;


  @override
  void intiState(){
    super.initState();
   _getResult();
  }

  Future<GetToken> _getPreferences() async {
    final token = await SharePreferrences().getToken() ?? '';
    final id = await SharePreferrences().getId() ?? 0;
    return GetToken(token: token, id: id);
  }


  Future<void> _getResult() async {
    final getToken = await _getPreferences();
    final dioInstance = DioInstance(getToken.token);
    try {
      final response = await dioInstance.dio.get('/result/${getToken.id}');

      if (response.statusCode == 200) {
        final results = dataResultsFromJson(jsonEncode(response.data));
        setState(() {
          dataResults.addAll(results);
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
    double screenWidth = MediaQuery.of(context).size.width;
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
            SizedBox(height: 8),
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
            SizedBox(height: 32),
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
                      SizedBox(height: 16),
                      // PlantDiseaseItem(
                      //   title: 'Cashew Bacterial blight',
                      //   date: 'Mar 1 2024',
                      //   imageUrl: 'https://pagacas.com/tenants/pagacas/upload/banner/benh-hai-dieu-4.jpg',
                      // ),
                      ListView(
                        shrinkWrap: true,
                        children: dataResults.map((dataResult) {
                          return PlantDiseaseItem(
                            title: "dasdasdasd",
                            date: DateFormat('MMM d yyyy').format(dataResult.createdAt),
                            imageUrl: 'https://pagacas.com/tenants/pagacas/upload/banner/benh-hai-dieu-4.jpg',
                          );
                        }).take(3).toList(),
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
                              Navigator.pushNamed(context, '/myplants');
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
      bottomNavigationBar: Navbar(),
    );
  }
}

