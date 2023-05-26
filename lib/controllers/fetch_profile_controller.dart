import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/apis/fetch_profile_api.dart';

import '../models/fetch_profile_model.dart';



class FetchProfileController extends GetxController{

  var isLoading = false.obs;
  final box = GetStorage();
  var list = <UserData>[];

  fetchProfile() async {
    try {
      isLoading(true);
      var apiResponse = await FetchProfileApi.fetchProfile(box.read('id').toString());

      if (apiResponse != null) {
        if (apiResponse.status == 'success') {
          list.assignAll(apiResponse.data!);
          box.write('name', list[0].name);
          box.write('email', list[0].emailId);
          box.write('number', list[0].phoneNo);
          box.write('profile_pic', list[0].baseUrlProfilePicture);
          box.write('cover_pic', list[0].baseUrlCoverPicture);
          print('done');
        }
      }
    } finally {
      isLoading(false);
    }
  }
}