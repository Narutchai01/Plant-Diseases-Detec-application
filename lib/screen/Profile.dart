import 'package:capstonec/Models/Account.dart';
import 'package:capstonec/Models/Model.dart';
import 'package:capstonec/utils/SharePreferrences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Account accountuser = Account(
  id: 0,
  name: '',
  email: '',
  createdAt: DateTime.now(),
);

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final dio = Dio();
  @override
  void initState() {
    super.initState();
    getAccount();
  }

  Future<GetToken> getPrefereces() async {
    String Token = (await SharePreferrences().getToken()) ?? '';
    int Id = (await SharePreferrences().getId()) ?? 0;
    GetToken gettoken = GetToken(token: Token, id: Id);
    return gettoken;
  }

  Future<void> getAccount() async {
    GetToken gettoken = await getPrefereces();
    await dio
        .get('http://10.63.201.157:3000/account/${gettoken.id}',
            options: Options(headers: {
              'x-jwt-token': gettoken.token,
            }))
        .then((res) {
      Account account = Account.fromJson(res.data);
      accountToJson(account);
      accountuser = account;
      return accountuser;
    }).catchError((err) {
      print(err);
    });
  }


  void handleLogout()  {
     SharePreferrences().removeToken();
     SharePreferrences().removeId();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    // print(accountuser.email);
    return SafeArea(
      child: Scaffold(
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
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          accountuser != null && accountuser.name != null
                              ? '${accountuser.name}'
                              : 'No name available',
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
                          accountuser != null && accountuser.email != null
                              ? '${accountuser.email}'
                              : 'No email available',
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
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF304D30),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        minimumSize:
                                            const Size(double.infinity, 42),
                                      ),
                                      child: const Row(
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
                                    padding: const EdgeInsets.all(12.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF304D30),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        minimumSize:
                                            const Size(double.infinity, 42),
                                      ),
                                      child: const Row(
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
                                    padding: const EdgeInsets.all(12.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        handleLogout();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF304D30),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        minimumSize:
                                            const Size(double.infinity, 42),
                                      ),
                                      child: const Row(
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
