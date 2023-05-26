import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/apis/home_content_api.dart';
import 'package:i_fitness/models/home_content_model.dart';
import 'package:url_launcher/url_launcher.dart';




class HomeContentController extends GetxController{

  var isLoading = false.obs;
  final box = GetStorage();
  var videoList = <DailyVideos>[];
  var bolgList = <Blogs>[];

  getHomeContent() async {
    print('home1');
    try {
      isLoading(true);
      var apiResponse = await HomeContentApi.getHomeContent();

      if (apiResponse != null) {
        if (apiResponse.status == 'success') {
          videoList.assignAll(apiResponse.dailyVideo!);
          bolgList.assignAll(apiResponse.blog!);
          print('home');
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