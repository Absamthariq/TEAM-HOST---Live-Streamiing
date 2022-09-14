import 'package:get/get.dart';
import 'package:streaming_app/Model/community.dart';
import 'package:streaming_app/Services/community_service.dart';

class CommunityController extends GetxController{
  List<AllCommunity>? totalCommunity = [];
 
RxBool loading = false.obs;

  Future<List<AllCommunity>?> getCommunity(String url) async {
    print("called");
    loading.value = true;
    try {
      
      var data = await AllCommunityService.getCommunityData();
      loading.value = false;
      
      return data;
    } catch (e) {
      loading.value =  false;
      print(e);
      return [];
    }
    
  }
  @override
  void onInit() {
    getCommunity('/all/community').then((value) => totalCommunity= value!);
    super.onInit();

  }
}