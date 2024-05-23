import 'package:dio/dio.dart';

class DioInstance {
 static final DioInstance _singleton = DioInstance._internal();

 factory DioInstance(String token) {
  final headers = {
   'Content-Type': 'application/json',
   if (token.isNotEmpty) 'x-jwt-token': token,
  };
  return _singleton..dio = Dio(BaseOptions(
   baseUrl: "http://localhost:3000",
   headers: headers,
  ));
 }

 DioInstance._internal();

 late Dio dio;
}