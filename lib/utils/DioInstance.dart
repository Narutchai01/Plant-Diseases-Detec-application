import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class DioInstance {
 static final DioInstance _singleton = DioInstance._internal();

 factory DioInstance() {
   return _singleton;
 }

  DioInstance._internal();

 static final Dio dio = Dio(BaseOptions(
   baseUrl: 'https://${dotenv.env['IPLOCAL']}:3000'
 ));
}


