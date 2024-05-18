import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Collections'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Identification of Your Plant Disease', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            PlantDiseaseItem(
              title: 'Cashew Bacterial blight',
              date: 'Mar 1 2024',
            ),
            const SizedBox(height: 10),
            PlantDiseaseItem(
              title: 'Cashew Bacterial blight',
              date: 'Mar 1 2024',
            ),
            const SizedBox(height: 10),
            PlantDiseaseItem(
              title: 'Cashew Bacterial blight',
              date: 'Mar 1 2024',
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text('See more'),
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

  const PlantDiseaseItem({Key? key, required this.title, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 17, 17, 17)),
        borderRadius: BorderRadius.circular(8),
      ),
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
    );
  }
}
