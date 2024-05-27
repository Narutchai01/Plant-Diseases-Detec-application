import 'package:flutter/material.dart';

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
            Navigator.pushNamed(context, "/profile");
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
                const Text(
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
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}