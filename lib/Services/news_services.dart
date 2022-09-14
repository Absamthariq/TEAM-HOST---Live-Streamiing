import 'package:dio/dio.dart';
import 'package:streaming_app/Model/news.dart';

class NewsServices {
  static Dio dio = Dio(BaseOptions(
      baseUrl:
          'https://newsapi.org/v2'));
  static Future<List<Article>?> getNewsData(String url) async {
    try {
      var response = await dio.get(url);
      News news = News.fromJson(response.data);
      return news.articles;
    } on DioError catch (e) {
      print(e.error);
      print(e.response!.data);
      print(e.response!.statusMessage);
      return null;
    }
   
  }
}
