import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:capstonec/utils/SharePreferrences.dart';


class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final dio = Dio();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  FocusNode _fullnameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmpasswordFocus = FocusNode();

 void _handleSignup() async  {

  String fullname = _fullnameController.text;
  String email = _emailController.text;
  String password = _passwordController.text;
  String confirmPassword = _confirmpasswordController.text;

  if (fullname.isEmpty ||
      email.isEmpty ||
      password.isEmpty ||
      confirmPassword.isEmpty) {
    _showErrorDialog('All fields are required.');
    return;
  }

  if (password != confirmPassword) {
    _showErrorDialog('Passwords do not match.');
    return;
  }
  await dio.post("http://10.63.201.157:3000/register", data: {
    "name": fullname,
    "email": email,
    "password": password,
  }).then((response) async {
    if (response.statusCode == 200) {
      SharePreferrences().saveToken(response.data["token"]);
      SharePreferrences().saveId(response.data["id"]);
      _showSuccessDialog();
      Navigator.pushNamed(context, "/profile");
    } else {
      _showErrorDialog('An error occurred. Please try again.');
    }
  }).catchError((error) {
    _showErrorDialog('An error occurred. Please try again.');
  });
}

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Sign up successful!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF0F0E5),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 100,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Sign up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF304D30),
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildInputBox(
                    controller: _fullnameController,
                    focusNode: _fullnameFocus,
                    labelText: 'Full name',
                  ),
                  const SizedBox(height: 24),
                  _buildInputBox(
                    controller: _emailController,
                    focusNode: _emailFocus,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 24),
                  _buildInputBox(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    labelText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  _buildInputBox(
                    controller: _confirmpasswordController,
                    focusNode: _confirmpasswordFocus,
                    labelText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _handleSignup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF304D30),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minimumSize: const Size(double.infinity, 36),
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account ?',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      TextButton(
                        onPressed: () {
                         Navigator.pushNamed(context, "/login");
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputBox({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String labelText,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF304D30)),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF304D30)),
          borderRadius: BorderRadius.circular(4),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      ),
    );
  }
}
