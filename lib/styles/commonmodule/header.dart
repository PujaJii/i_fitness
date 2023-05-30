import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../views/notification.dart';
import '../../views/profile.dart';

class HeaderView extends StatelessWidget {
  final int index;
  const HeaderView(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    return
        Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,),
              child: Image.asset('assets/images/logo.png',
                  scale: 14),
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.to(() => const NotificationPage());
                    },
                    child: const Icon(Icons.notifications_on_outlined, color: Colors.white,size: 26,)),
                const SizedBox(width: 20,),
                InkWell(
                  onTap: () {
                    Get.to(() => ProfilePage(index));
                    debugPrint('a$index');
                  },
                  child: Hero(
                    tag: 'a$index',
                    child:
                    box.read('profile_pic').toString() != ''?
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(box.read('profile_pic').toString()),):
                    const CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/profile_img.png'),),
                  ),
                ),
                const SizedBox(width: 15,)
              ],
            ),
          ],
        ),
      );
  }
}
