import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaming_app/Screens/login%20Page/login_page.dart';
import 'package:streaming_app/Services/dio_client.dart';

class SignInAuthService {
  static Dio dio = DioClient.dio;

  static loginUser(Map credential, BuildContext context) async {
    try {
      var response = await dio.post('/signup', data: credential);
      // ignore: use_build_context_synchronously
      print(response.data);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
      
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.data);
    } catch (e) {
      print(e);
    }
  }
}
