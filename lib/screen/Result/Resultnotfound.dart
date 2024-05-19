import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Resultnotfound extends StatefulWidget {
  const Resultnotfound({Key? key}) : super(key: key);

  @override
  _ResultnotfoundState createState() => _ResultnotfoundState();
}

class _ResultnotfoundState extends State<Resultnotfound> {
  final PageController _pageController = PageController();

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
      body: Column(
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
          SizedBox(height: 24),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/grownplant.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 20), //spacing
                  Text(
                    'Do not found any disease',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12), // Add some spacing between the texts
                  Text(
                    'Look like your plant is healthy.\nYou can try again by taking another photo.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Resultnotfound(),
  ));
}
