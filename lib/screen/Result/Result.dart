import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final PageController _pageController = PageController();
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = false; // Initialize _isExpanded to false
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
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
                    children: [
                      Image.asset(
                        'assets/images/pic01.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/pic02.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/pic03.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
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
                      effect: ScrollingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: const Color(0xFF304D30),
                        dotColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Column(
                children: [
                  Text(
                    'Cassava',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Brown Leaf Spot',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 100,
              color: Color(0xFF304D30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/pic01.jpg',
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12),
                    Image.asset(
                      'assets/images/pic02.jpg',
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12),
                    Image.asset(
                      'assets/images/pic03.jpg',
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12),
                    Image.asset(
                      'assets/images/pic01.jpg',
                      width: 75,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF304D30),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Color(0xFF304D30),
                  ),
                ),
                child: ExpansionTile(
                  title: Text(
                    'Symptoms & Life Cycle',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Color(0xFF304D30),
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  initiallyExpanded: _isExpanded,
                  trailing: Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded = value;
                    });
                  },
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Leaf spots are circular, up to 15 mm diameter, becoming angular and limited by veins (Photos 1&2). The spots are brown on upper surfaces with dark borders, sometimes surrounded by indistinct yellow margins.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Warm, humid weather increases the severity of the disease. Spores of the fungus produced on the lower surface are spread by wind and water-splash. Long distance spread occurs when spores are carried on planting material.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF304D30),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Color(0xFF304D30),
                  ),
                ),
                child: ExpansionTile(
                  title: Text(
                    'Impact',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Color(0xFF304D30),
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  initiallyExpanded: _isExpanded,
                  trailing: Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded = value;
                    });
                  },
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Leaf spots are circular, up to 15 mm diameter, becoming angular and limited by veins (Photos 1&2). The spots are brown on upper surfaces with dark borders, sometimes surrounded by indistinct yellow margins.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Warm, humid weather increases the severity of the disease. Spores of the fungus produced on the lower surface are spread by wind and water-splash. Long distance spread occurs when spores are carried on planting material.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF304D30),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Color(0xFF304D30),
                  ),
                ),
                child: ExpansionTile(
                  title: Text(
                    'Detection & inspection',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Color(0xFF304D30),
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  initiallyExpanded: _isExpanded,
                  trailing: Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded = value;
                    });
                  },
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Leaf spots are circular, up to 15 mm diameter, becoming angular and limited by veins (Photos 1&2). The spots are brown on upper surfaces with dark borders, sometimes surrounded by indistinct yellow margins.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Warm, humid weather increases the severity of the disease. Spores of the fungus produced on the lower surface are spread by wind and water-splash. Long distance spread occurs when spores are carried on planting material.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF304D30),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Color(0xFF304D30),
                  ),
                ),
                child: ExpansionTile(
                  title: Text(
                    'Management',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Color(0xFF304D30),
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  initiallyExpanded: _isExpanded,
                  trailing: Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded = value;
                    });
                  },
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Leaf spots are circular, up to 15 mm diameter, becoming angular and limited by veins (Photos 1&2). The spots are brown on upper surfaces with dark borders, sometimes surrounded by indistinct yellow margins.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Warm, humid weather increases the severity of the disease. Spores of the fungus produced on the lower surface are spread by wind and water-splash. Long distance spread occurs when spores are carried on planting material.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
