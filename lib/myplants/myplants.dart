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
    {'name': 'Cashew Bacterial Blight', 'date': 'Mar 2 2024'},
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
                Text(_sortOptionToString(_sortOption)),
                PopupMenuButton<SortOption>(
                  icon: const Icon(Icons.filter_list),
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
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.sort),
            label: 'เรียงลำดับ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add), // Add an icon for another action
            label: 'เพิ่ม', // Add a label for another action
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            showSortOptions(context);
          } else if (index == 1) {
            // Handle the action for the second item
          }
        },
      ),
    );
  }

  void showSortOptions(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
      items: <PopupMenuEntry<SortOption>>[
        PopupMenuItem<SortOption>(
          value: SortOption.byName,
          child: Text('เรียงตามชื่อ'),
        ),
        PopupMenuItem<SortOption>(
          value: SortOption.byDate,
          child: Text('เรียงตามวันเวลา'),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {
        _sortPlants(value);
      }
    });
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
