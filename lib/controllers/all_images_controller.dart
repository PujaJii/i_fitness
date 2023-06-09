import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/models/all_images.dart';

import '../apis/all_images_api.dart';




class FetchImagesController extends GetxController{

  var isLoading = false.obs;
  final box = GetStorage();
  var list = <ListData>[];

  fetchImages() async {
    try {
      isLoading(true);
      var apiResponse = await FetchImagesApi.getDailyImages();

      if (apiResponse != null) {
        if (apiResponse.status == 'success') {
          list.assignAll(apiResponse.data!);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}