import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:streaming_app/Screens/navigation_bar/navbar.dart';
import 'package:streaming_app/Services/dio_client.dart';

import '../main.dart';

class UserAuthService {
  static Dio dio = DioClient.dio;

  static loginUser(Map credential, BuildContext context) async {
    try {
      var response = await dio.post('/login', data: credential);
      Get.offAll(FloatingNavbar());
      print(response.data);

      LocalStorage.savetoken(
        token: response.data['token'],
        name: response.data['name'],
        userid: response.data['_id'],
      );
      
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.data);
      Get.showSnackbar(GetSnackBar(
        message: e.response == null
            ? "something went wrong"
            : e.response!.data['message'],
        title: 'Warning',
        duration: Duration(seconds: 2),
      ));
    } catch (e) {
      print(e);
    }
  }
}

class LocalStorage {
  static final box = GetStorage();
  static savetoken(
      {required String token, required String userid, required String name}) {
    box.write('token', token);
    box.write('userid', userid);
    box.write("name", name);
  }

  static String gettoken(String key) {
    return box.read(key);
  }
}
