import 'package:capstonec/Model/Model.dart';
import 'package:capstonec/utils/DioInstance.dart';
import 'package:capstonec/utils/SharePreferrences.dart';
import 'package:flutter/material.dart';

class Editscreen extends StatefulWidget {
  const Editscreen({Key? key}) : super(key: key);

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  late String fullName ;
  late String email ;

  @override
  void initState() {
    super.initState();
    getAccount();
  }
  Future<GetToken> _getPreferences() async {
    final token = await SharePreferrences().getToken() ?? '';
    final id = await SharePreferrences().getId() ?? 0;
    return GetToken(token: token, id: id);
  }

  Future<void> getAccount() async {
    final token = await _getPreferences();
    final dioinstance = DioInstance(token.token);
    await dioinstance.dio.get('/account/${token.id}').then((res) {
      final data = res.data;
      setState(() {
        fullName = data['name'];
        email = data['email'];
      });
    }).catchError((error) {
      print(error);
    });
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


  void handleSubmit() async {
    final token = await _getPreferences();
    final dioinstance = DioInstance(token.token);
    await dioinstance.dio.patch('/account/${token.id}', data: {
      'name': fullName,
      'email': email,
    }).then((res) {
      Navigator.pushNamed(context, '/profile');
    }).catchError((error) {
      print(error);
    });
  }







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
                    initialValue: fullName, // กำหนดค่าเริ่มต้น
                    onChanged: (value) {
                      fullName = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: TextFormField(
                    initialValue: email, // กำหนดค่าเริ่มต้น
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
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
                      onPressed: () {
                          handleSubmit();
                      },
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
