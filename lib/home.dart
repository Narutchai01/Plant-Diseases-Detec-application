import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
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
                decoration: BoxDecoration(
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
                      PlantDiseaseItem(
                        title: 'Cashew Bacterial blight',
                        date: 'Mar 1 2024',
                        imageUrl: 'https://pagacas.com/tenants/pagacas/upload/banner/benh-hai-dieu-4.jpg',
                      ),
                      const SizedBox(height: 10),
                      PlantDiseaseItem(
                        title: 'Cashew Bacterial blight',
                        date: 'Mar 1 2024',
                        imageUrl: 'https://pagacas.com/tenants/pagacas/upload/banner/benh-hai-dieu-4.jpg',
                      ),
                      const SizedBox(height: 10),
                      PlantDiseaseItem(
                        title: 'Cashew Bacterial blight',
                        date: 'Mar 1 2024',
                        imageUrl: 'https://pagacas.com/tenants/pagacas/upload/banner/benh-hai-dieu-4.jpg',
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
                            onPressed: () {},
                            child: Text(
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
    );
  }
}

class PlantDiseaseItem extends StatelessWidget {
  final String title;
  final String date;
  final String imageUrl;

  const PlantDiseaseItem({
    Key? key,
    required this.title,
    required this.date,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Add your navigation logic here
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.network(
                  imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        date,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Text(
                  '>', // '>' symbol for navigation
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.black, 
        ), 
      ],
    );
  }
}
