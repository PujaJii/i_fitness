import 'package:get/get.dart';
import '../apis/cat_api.dart';
import '../apis/video_api.dart';
import '../models/cat_model.dart';
import '../models/vodeo_model.dart';

class WorkoutController extends GetxController{

  var isLoading = false.obs;
  var videoList = <VideoDataList>[].obs;

  var catList = <CatDataList>[].obs;


  getVideoList (String catId) async {
    try {
      isLoading(true);
      var api_response = await VideoApi.getVideoData(catId);

      if (api_response != null) {
        if (api_response.response == 'ok') {
          videoList.assignAll(api_response.data!);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  getCatList () async {
    try {
      isLoading(true);
      var api_response = await CatApi.getCatData();

      if (api_response != null) {
        if (api_response.response == 'ok') {
          catList.assignAll(api_response.data!);
        }
      }
    } finally {
      isLoading(false);
    }
  }

}