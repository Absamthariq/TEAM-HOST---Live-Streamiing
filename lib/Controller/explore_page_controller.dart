import 'package:get/get.dart';
import 'package:streaming_app/Model/user_data.dart';
import 'package:streaming_app/Services/get_all_users.dart';

class ExplorePageController extends GetxController{
  List<User> totalUsers =[];
  RxBool loading =true.obs;


  Future<List<User>?> getUsersData()async{
    loading.value= true;
    try {
      var data = await AllUsersService.getUserData();
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
    getUsersData().then((value) => totalUsers= value!);
    super.onInit();

  }
}