import 'package:capstonec/Models/Account.dart';
import 'package:capstonec/components/NavBar.dart';
import 'package:capstonec/utils/SharePreferrences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../Model/Model.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _dio = Dio();
  Account? _accountUser;

  @override
  void initState() {
    super.initState();
    _getAccount();
  }

  Future<GetToken> _getPreferences() async {
    final token = await SharePreferrences().getToken() ?? '';
    final id = await SharePreferrences().getId() ?? 0;
    return GetToken(token: token, id: id);
  }

  Future<void> _getAccount() async {
    final getToken = await _getPreferences();
    try {
      final response = await _dio.get(
        'http://localhost:3000/account/${getToken.id}',
        options: Options(headers: {'x-jwt-token': getToken.token}),
      );
      final account = Account.fromJson(response.data);
      setState(() {
        _accountUser = account;
      });
    } catch (err) {
      print(err);
    }
  }

  void _handleLogout() {
    SharePreferrences().removeToken();
    SharePreferrences().removeId();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Navbar(), // Added Navbar()
        body: Container(
          decoration: const BoxDecoration(
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
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          _accountUser?.name ?? 'No name available',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          _accountUser?.email ?? 'No email available',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: EdgeInsets.zero,
                        height: 600,
                        width: 400,
                        decoration: const BoxDecoration(
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
                              decoration: const BoxDecoration(
                                color: Color(0xFFF0F0E5),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                ),
                              ),
                              child: const SizedBox.shrink(),
                            ),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(height: 16),
                                  _buildButton(
                                    onPressed: () {}, // Add onPressed callback
                                    icon: Icons.edit,
                                    label: 'Edit Profile',
                                  ),
                                  _buildButton(
                                    onPressed: () {}, // Add onPressed callback
                                    icon: Icons.change_circle,
                                    label: 'Change Password',
                                  ),
                                  _buildButton(
                                    onPressed: _handleLogout,
                                    icon: Icons.exit_to_app,
                                    label: 'Logout',
                                  ),
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

  Widget _buildButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF304D30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          minimumSize: const Size(double.infinity, 42),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Icon(icon, color: Colors.white),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}