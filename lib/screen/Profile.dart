import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/70/d7/38/70d738462ff22bfbe2248253e3570a17.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Narutchai Mauensean',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          'fluklnwza007@gmail.com',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Container(
                        padding: EdgeInsets.zero,
                        height: 600,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Color(0xFFF0F0E5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 32,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F0E5),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                ),
                              ),
                              child: SizedBox.shrink(),
                            ),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: 16),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF304D30),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        minimumSize: Size(double.infinity, 42),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 12),
                                          Icon(Icons.edit, color: Colors.white),
                                          SizedBox(width: 16),
                                          Text(
                                            'Edit Profile',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF304D30),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        minimumSize: Size(double.infinity, 42),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 12),
                                          Icon(Icons.change_circle,
                                              color: Colors.white),
                                          SizedBox(width: 16),
                                          Text(
                                            'Change Password',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF304D30),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        minimumSize: Size(double.infinity, 42),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 12),
                                          Icon(Icons.exit_to_app,
                                              color: Colors.white),
                                          SizedBox(width: 16),
                                          Text(
                                            'Logout',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}
