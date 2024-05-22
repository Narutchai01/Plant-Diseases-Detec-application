import 'package:flutter/material.dart';

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

  void _resetSort() {
    setState(() {
      _sortOption = SortOption.byName;
      _sortPlants(_sortOption);
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: highlightBorderColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                    color: selectedItemColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    _sortOptionToString(_sortOption),
                    style: TextStyle(
                      color: selectedTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: _resetSort,
                    ),
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
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: plants.length,
              itemBuilder: (context, index) {
                final plant = plants[index];
                final isSelected = plant['name'] == _selectedPlantName;
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlantDetails(
                              name: plant['name']!,
                              date: plant['date']!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: isSelected ? selectedItemColor : backgroundColor,
                        child: ListTile(
                          leading: Image.network(
                            'https://pagacas.com/tenants/pagacas/upload/banner/benh-hai-dieu-4.jpg',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            plant['name']!,
                            style: TextStyle(
                              color: isSelected ? selectedTextColor : Colors.black,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                          subtitle: Text(
                            plant['date']!,
                            style: TextStyle(
                              color: isSelected ? selectedTextColor : Colors.black,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios, size: 24.0),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlantDetails(
                                    name: plant['name']!,
                                    date: plant['date']!,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
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
            icon: Icon(Icons.sort), // เปลี่ยนตำแหน่ง Icon(Icons.sort) ไปที่นี่
            label: 'เรียงลำดับ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add), // ย้ายตำแหน่ง Icon(Icons.add) มาที่นี่
            label: 'เพิ่ม',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            // Handle the action for the first item
          } else if (index == 1) {
            showSortOptions(context);
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

class PlantDetails extends StatelessWidget {
  final String name;
  final String date;

  const PlantDetails({Key? key, required this.name, required this.date}) : super(key: key);

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
              Text(name, style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 16.0),
              Text('Date: $date', style: Theme.of(context).textTheme.subtitle1),
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
