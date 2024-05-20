import 'package:flutter/material.dart';

final Color backgroundColor = const Color(0xFFF0F0E5);

enum SortOption { byName, byDate }

class MyPlants extends StatefulWidget {
  const MyPlants({Key? key}) : super(key: key);

  @override
  State<MyPlants> createState() => _MyPlantsState();
}

class _MyPlantsState extends State<MyPlants> {
  SortOption _sortOption = SortOption.byName;

  final List<Map<String, String>> plants = [
    {'name': 'Cashew Bacterial Blight', 'date': 'Mar 1 2024'},
    {'name': 'Cashew Bacterial Blight', 'date': 'Mar 1 2024'},
    {'name': 'Cashew Bacterial Blight', 'date': 'Mar 1 2024'},
    {'name': 'Cashew Bacterial Blight', 'date': 'Mar 1 2024'},
    {'name': 'Cashew Bacterial Blight', 'date': 'Mar 1 2024'},
    // Add more plants as needed
  ];

  void _sortPlants(SortOption option) {
    setState(() {
      _sortOption = option;
      switch (_sortOption) {
        case SortOption.byName:
          plants.sort((a, b) => a['name']!.compareTo(b['name']!));
          break;
        case SortOption.byDate:
          plants.sort((a, b) => a['date']!.compareTo(b['date']!));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [
          PopupMenuButton<SortOption>(
            icon: const Icon(Icons.filter_list), // เปลี่ยนไอคอนนี้
            itemBuilder: (context) => <PopupMenuEntry<SortOption>>[
              PopupMenuItem<SortOption>(
                value: SortOption.byName,
                child: Text('เรียงตามชื่อ'),
              ),
              PopupMenuItem<SortOption>(
                value: SortOption.byDate,
                child: Text('เรียงตามวันเวลา'),
              ),
            ],
            onSelected: _sortPlants,
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Image.network(
                  'https://pagacas.com/tenants/pagacas/upload/banner/benh-hai-dieu-4.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(plants[index]['name']!),
                subtitle: Text(plants[index]['date']!),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 24.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlantDetails(
                          name: plants[index]['name']!,
                          date: plants[index]['date']!,
                        ),
                      ),
                    );
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlantDetails(
                        name: plants[index]['name']!,
                        date: plants[index]['date']!,
                      ),
                    ),
                  );
                },
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}

class PlantDetails extends StatefulWidget {
  final String name;
  final String date;

  const PlantDetails({Key? key, required this.name, required this.date}) : super(key: key);

  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 24.0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Plant Details'),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name, style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 16.0),
              Text('Date: ${widget.date}', style: Theme.of(context).textTheme.subtitle1),
              const SizedBox(height: 16.0),
              // Add more details about the plant here
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyPlants(),
  ));
}
