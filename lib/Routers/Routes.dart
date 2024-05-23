import 'package:capstonec/screen/Camera/CameraScreen.dart';
import 'package:capstonec/screen/Profile.dart';
import 'package:capstonec/screen/Signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capstonec/screen/login/login.dart';

class Routes {
  static const String profile = '/profile';
  static const String signup = '/signup';
  static const String Login = '/login';
  static const String camera = '/camera';
  static Map<String, WidgetBuilder> routes = {
    Login: (context) => LoginScreen(),
    signup: (context) => Signup(),
    profile: (context) => Profile(),
    camera: (context) => CameraScreen(),
  };

}