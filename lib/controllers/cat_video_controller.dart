import 'package:get/get.dart';

import '../apis/video_api.dart';
import '../models/video_model.dart';

class  CatVideoController extends GetxController{
  var isLoading = false.obs;
  var videoList = <VideoDataList>[].obs;

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
}