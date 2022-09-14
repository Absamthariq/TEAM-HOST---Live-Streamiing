import 'package:dio/dio.dart';

class DioClient{
  static Dio dio= Dio(BaseOptions(
    baseUrl: 'http://192.168.1.180:3005'
  )
  );
}