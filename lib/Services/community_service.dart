import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:streaming_app/Model/user_data.dart';
import 'package:streaming_app/Services/dio_client.dart';

import '../Model/community.dart';

class AllCommunityService {
  static Dio dio = DioClient.dio;
  static Future<List<AllCommunity>?> getCommunityData() async {
    try {
      var response = await dio.get('/all/community');
      print(response.data);
      List<AllCommunity> allCommunity = allCommunitiesFromJson(jsonEncode(response.data));
      print(allCommunity.last.name);
      return allCommunity;
    } on DioError catch (e) {
      print(e.message);
      print(e.response!.data);
    } catch (e) {
      print(e);
    }
  }
}
