import 'package:capstonec/screen/Camera/CameraScreen.dart';
import 'package:capstonec/screen/Profile/Profile.dart';
import 'package:capstonec/screen/Signup/Signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capstonec/screen/login/login.dart';
import 'package:capstonec/screen/HomePage.dart';
import "package:capstonec/screen/myplants/myplants.dart";
import 'package:capstonec/screen/Editpage/edit.dart';
import 'package:capstonec/screen/changePassword/editpassword.dart';

class Routes {
  static const String profile = '/profile';
  static const String signup = '/signup';
  static const String Login = '/login';
  static const String camera = '/camera';
  static const String home = '/home';
  static const String myplants = '/myplants';
  static const String editpage = '/editpage';
  static const String editpassword = '/editpassword';
  static Map<String, WidgetBuilder> routes = {
    Login: (context) => LoginScreen(),
    signup: (context) => Signup(),
    profile: (context) => Profile(),
    camera: (context) => CameraScreen(),
    home : (context) => HomePage(),
    myplants : (context) => MyPlants(),
    editpage : (context) => Editscreen(),
    editpassword : (context) => Editpassword(),
  };

}