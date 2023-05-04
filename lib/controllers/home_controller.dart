import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../apis/home_api.dart';
import '../models/home_models.dart';

class HomeController extends GetxController{

  var isLoading = false.obs;
  var videoList = <HomeDataList>[].obs;
  var imgList = <HomeDataList>[].obs;


  getHomeVideo (String type) async {
    try {
      isLoading(true);
      var api_response = await HomeApi.getHomeData(type);

      if (api_response != null) {
        if (api_response.response == 'ok') {
          // videoList.assignAll(api_response.data!);
          videoList.assignAll(api_response.data!);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  getHomeImg(String type) async {
    try {
      isLoading(true);
      var api_response = await HomeApi.getHomeData(type);

      if (api_response != null) {
        if (api_response.response == 'ok') {
          imgList.assignAll(api_response.data!);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  static launchCaller(String url) async {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
    }
  }

  static Future<void> share(url) async {
    await FlutterShare.share(
        title: 'I-Fitness',
        text: url,
        linkUrl: 'Download the I-Fitness app by clicking this link',
        chooserTitle: 'I-Fitness');
  }
}
