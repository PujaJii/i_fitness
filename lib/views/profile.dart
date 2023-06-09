import 'dart:io';

import 'package:global_configuration/global_configuration.dart';
import 'package:i_fitness/controllers/fetch_profile_controller.dart';
import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/common_module/my_widgets.dart';
import 'package:i_fitness/views/edit_profile.dart';
import 'package:i_fitness/regis/login_view.dart';
import 'package:i_fitness/views/notification.dart';
import 'package:i_fitness/views/privacy_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/home_controller.dart';
import '../styles/button_style.dart';

class ProfilePage extends StatefulWidget {
  final int index;

  const ProfilePage(this.index, {Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final box = GetStorage();
  FetchProfileController fetchProfileController = Get.put(FetchProfileController());
  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch =
        Uri(scheme: 'https', host: 'play.google.com', path: 'store/games');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: MyWidgets.textView('Personalise', Colors.white, 19,
              fontWeight: FontWeight.bold),
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 8),
              // height: 30,
              // width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black54),
              child: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: GetX<FetchProfileController>(initState: (context) {
          fetchProfileController.fetchProfile();
        }, builder: (controller) {
          if (controller.isLoading.value) {
            return Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                color: AppColors.btnColor2,
              )),
            );
          } else {
            return Stack(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/spbg.jpg',
                      fit: BoxFit.cover,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const SizedBox(height: 50,),
                    coverImage == null
                        ? Container(
                            height: 220,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.black, Colors.grey])),
                            child: Center(
                                child: InkWell(
                                 onTap: () {
                                   _getCoverImage();
                                 },
                                 child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white)),
                                  child: MyWidgets.textView(
                                      'Upload Cover Pic', Colors.white, 17)),
                            )),
                          )
                        : Container(
                            height: 220,
                            width: double.infinity,
                            alignment: Alignment.bottomRight,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(coverImage),
                                    fit: BoxFit.cover)),
                            child: InkWell(
                              onTap: () {
                                _getCoverImage();
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white38,
                                      border: Border.all(color: Colors.black)),
                                  child: MyWidgets.textView(
                                      'Change Cover', Colors.black, 17)),
                            ),
                          ),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            MyWidgets.textView('     ${box.read('name').toString()}    |', Colors.white, 12),
                            MyWidgets.textView('    ${box.read('number').toString()}', Colors.white, 12),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            showLogOutDialog();
                          },
                          child: Container(
                            height: 25,
                            width: 90,
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.blueAccent,
                                    AppColors.themeColor,
                                  ],
                                )),
                            child: Center(
                                child: MyWidgets.textView(
                                    'Log out', Colors.white, 13,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        height: 3,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0,top: 10),
                            child: MyWidgets.textView(
                                'Settings', Colors.white, 16),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const EditProfile());
                            },
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset('assets/images/user.png',
                                      color: Colors.white),
                                ),
                                MyWidgets.textView(
                                    '  Edit Profile', Colors.white, 14)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              //showAccountDialog();
                            },
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                      'assets/images/add_friend.png',
                                      color: Colors.white),
                                ),
                                MyWidgets.textView(
                                    '  Account', Colors.white, 14)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                    'assets/images/stretching.png',
                                    color: Colors.white),
                              ),
                              MyWidgets.textView('  Warmup', Colors.white, 14)
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                    'assets/images/image_gallery.png',
                                    color: Colors.white),
                              ),
                              MyWidgets.textView(
                                  '  Save progress pictures in gallery',
                                  Colors.white,
                                  14)
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const NotificationPage());
                            },
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                      'assets/images/notification.png',
                                      color: Colors.white),
                                ),
                                MyWidgets.textView(
                                    '  Notification', Colors.white, 14)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const PrivacyPage('  Privacy'));
                            },
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                      'assets/images/account.png',
                                      color: Colors.white),
                                ),
                                MyWidgets.textView(
                                    '  Privacy', Colors.white, 14)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              height: 3,
                              width: double.infinity,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyWidgets.textView(
                                    'Discover more', Colors.white, 18),
                                const SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                    onTap: () {
                                      HomeController.launchCaller(
                                          'https://play.google.com/store/apps/details?id=com.police.naman');
                                    },
                                    child: MyWidgets.textView(
                                        'Support & feedback',
                                        Colors.white,
                                        14)),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      Get.to(() => const PrivacyPage(
                                          'Terms & conditions'));
                                    },
                                    child: MyWidgets.textView(
                                        'Terms & conditions',
                                        Colors.white,
                                        14)),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                controller.list[0].profilePicture == ''?
                Positioned(
                  left: 15,
                  top: 180,
                  child: Hero(
                    tag: 'a${widget.index}',
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 33,
                      backgroundImage:
                          AssetImage('assets/images/profile_img.png'),
                    ),
                  ),
                ):
                Positioned(
                  left: 15,
                  top: 180,
                  child: CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 33,
                    backgroundImage:
                        NetworkImage(controller.list[0].baseUrlProfilePicture!),
                  ),
                ),
              ],
            );
          }
        }));
  }
  var baseUrl = GlobalConfiguration().get('base_url');

  var coverImage;
  ImagePicker picker = ImagePicker();

  _getCoverImage() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 180,
      maxHeight: 180,
    );
    if (pickedFile != null) {
      setState(() {
        coverImage = File(pickedFile.path);
      });
    }
  }

  showLogOutDialog() async {
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you want to Log Out?',
              style: TextStyle(fontSize: 18)),
          content: const Text('This will redirect you to Log in page',
              style: TextStyle(fontSize: 15)),
          actions: [
            ElevatedButton(
              //style: curveButtonStyleThemeColor,
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.themeColor)),
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              //style: curveButtonStyleThemeColor,
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.themeColor)),
              child:
                  const Text('Log Out', style: TextStyle(color: Colors.white)),
              onPressed: () {
                // Navigator.of(context).pop();
                box.write('isLoading', false);
                Get.offAll(() => const LoginView());
              },
            ),
          ],
        );
      },
    );
  }

  _showAccountDialog() async {
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Switch Account?', style: TextStyle(fontSize: 18)),
          content: const Text('This will redirect you to Log in page',
              style: TextStyle(fontSize: 15)),
          actions: [
            ElevatedButton(
              style: curveButtonStyleThemeColor,
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: curveButtonStyleThemeColor,
              child:
                  const Text('Log Out', style: TextStyle(color: Colors.white)),
              onPressed: () {
                // Navigator.of(context).pop();
                box.write('isLoading', false);
                Get.offAll(() => const LoginView());
              },
            ),
          ],
        );
      },
    );
  }
}
