import 'package:capstonec/Model/Model.dart';
import 'package:capstonec/Models/Account.dart';
import 'package:capstonec/components/NavBar.dart';
import 'package:capstonec/utils/DioInstance.dart';
import 'package:capstonec/utils/SharePreferrences.dart';
import 'package:flutter/material.dart';

class Editscreen extends StatefulWidget {
  const Editscreen({Key? key}) : super(key: key);

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  Account? _account;

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
      final account = Account.fromJson(res.data);
      setState(() {
        _account = account;
      });
    }).catchError((error) {
      print(error);
    });
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


  // void handleSubmit() async {
  //   final token = await _getPreferences();
  //   final dioinstance = DioInstance(token.token);
  //   await dioinstance.dio.patch('/account/${token.id}', data: {
  //     'name': fullName,
  //     'email': email,
  //   }).then((res) {
  //     Navigator.pushNamed(context, '/profile');
  //   }).catchError((error) {
  //     print(error);
  //   });
  // }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 229, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(240, 240, 229, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Icon ย้อนกลับ
          onPressed: () {
            Navigator.pop(context); // เมื่อปุ่มถูกกด ย้อนกลับไปหน้าก่อนหน้า
          },
        ),
        title: const Text('Edit Profile'), // หัวข้อบน AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(240, 240, 229, 1), // สีพื้นหลัง
        ),
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: TextFormField(
                    initialValue: _account?.name ?? "" ,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: TextFormField(
                    initialValue: _account?.email ?? "",
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(48, 77, 48, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4), // มุมโค้ง
                        ),
                      ),
                      child: const Text(
                        "SAVE",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      onPressed: () {
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
