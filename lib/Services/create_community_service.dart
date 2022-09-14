import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streaming_app/Controller/community_controller.dart';
import 'package:streaming_app/Services/auth_service.dart';
import 'package:streaming_app/Services/community_service.dart';
import 'package:streaming_app/Services/dio_client.dart';

class CreateCommunityService {
  static final CommunityController controller = Get.find<CommunityController>();
  static Dio dio = DioClient.dio;

  static cretecommunity(Map credential, BuildContext context) async {
    try {
      String token = LocalStorage.gettoken('token');

      var response = await dio.post('/new/community',
          data: credential, options: Options(headers: {'token': token}));
      // ignore: use_build_context_synchronously
      print(response.data);
      controller.totalCommunity =
          await controller.getCommunity('/all/community');
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginPage()),
      // );

    } on DioError catch (e) {
      print(e.error);
      print(e.response!.data);
    } catch (e) {
      print(e);
    }
  }
}
