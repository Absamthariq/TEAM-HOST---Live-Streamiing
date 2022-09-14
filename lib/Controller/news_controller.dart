import 'package:get/get.dart';
import 'package:streaming_app/Model/news.dart';
import 'package:streaming_app/Services/news_services.dart';

class NewsController extends GetxController {
  List<Article> totalArticles = [];
 
RxBool loading = true.obs;

  Future<List<Article>?> getNewsArticle(String url) async {
    loading.value = true;
    try {
      print(url);
      var data = await NewsServices.getNewsData(url);
      loading.value = false;
      print(data);
      return data;
    } catch (e) {
      loading.value =  false;
      print(e);
      return [];
    }
    
  }
  @override
  void onInit() {
    getNewsArticle('/top-headlines?sources=ign&apiKey=57ec08721a2b4e859eeaee673f31a86a').then((value) => totalArticles= value!);
    super.onInit();

  }
}
