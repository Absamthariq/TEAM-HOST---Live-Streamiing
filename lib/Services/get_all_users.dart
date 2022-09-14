import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:streaming_app/Controller/explore_page_controller.dart';
import 'package:streaming_app/Model/user_data.dart';
import 'package:streaming_app/Services/auth_service.dart';
import 'package:streaming_app/Services/dio_client.dart';

class AllUsersService {
  static Dio dio = DioClient.dio;

  static ExplorePageController explorePageController =
      Get.find<ExplorePageController>();

  static Future<List<User>?> getUserData() async {
    print("Get all users function called");
    try {
      var response = await dio.get('/all/users');

      print(response.data);

      List<User> allUsers = userFromJson(jsonEncode(response.data));
      return allUsers;
    } on DioError catch (e) {
      print(e.message);
      print(e.response!.data);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<void> followUser(
      Map<String, dynamic> followPayload, String token) async {
    try {
      var response = await dio.patch('/follow/user',
          data: followPayload,
          options: Options(headers: {
            "Token": token,
          }));

      print(response.data);
      explorePageController.totalUsers =
          (await explorePageController.getUsersData())!;
    } on DioError catch (e) {
      print(e.message);
      print("dio error ");
      print(e.response!.data);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> unFollowUser(
      Map<String, dynamic> unfollowpayload, String token) async {
    try {
      var response = await dio.patch(
        '/un/follow',
        data: unfollowpayload,
        options: Options(
          headers: {
            "Token": token,
          },
        ),
      );

      print(response.data);
      explorePageController.totalUsers =
          (await explorePageController.getUsersData())!;
    } on DioError catch (e) {
      print(e.message);
      print(e.error);
      print(e.response!.data);
    } catch (e) {
      print(e);
    }
  }
}
