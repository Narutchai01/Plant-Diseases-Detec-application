import 'package:flutter/material.dart';

class Editscreen extends StatefulWidget {
  const Editscreen({Key? key}) : super(key: key);

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 229, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 240, 229, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icon ย้อนกลับ
          onPressed: () {
            Navigator.pop(context); // เมื่อปุ่มถูกกด ย้อนกลับไปหน้าก่อนหน้า
          },
        ),
        title: Text('Edit Profile'), // หัวข้อบน AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 240, 229, 1), // สีพื้นหลัง
        ),
        padding: EdgeInsets.all(8.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(48, 77, 48, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4), // มุมโค้ง
                        ),
                      ),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
