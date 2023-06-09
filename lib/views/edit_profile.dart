import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/controllers/edit_controller.dart';
import 'package:i_fitness/views/change_password.dart';
import 'package:image_picker/image_picker.dart';

import '../styles/app_colors.dart';
import '../styles/button_style.dart';
import '../styles/common_module/my_widgets.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final box = GetStorage();
  EditProfileController controller = Get.put(EditProfileController());
  bool isSelecting = false;


  @override
  void initState() {
    controller.name.text =  box.read('name');
    controller.number.text =  box.read('number');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/images/loginbg.jpg', fit: BoxFit.cover,)
          ),
          ListView(
            children: [
              const SizedBox(height: 100),
              Center(
                 child: Stack(
                   children: [
                     box.read('profile_pic').toString() != ''&& isSelecting == false?
                     CircleAvatar(
                         radius: 40,
                         backgroundColor: Colors.white54,
                         backgroundImage: NetworkImage(box.read('profile_pic').toString())):
                     profileImage == null?
                     const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/profile_img.png')):
                      CircleAvatar(
                         radius: 40,
                         backgroundImage: FileImage(profileImage)),
                     Positioned(
                       right: 0,
                       bottom: 0,
                       child: InkWell(
                         onTap: () {
                           _getProfileImage();
                         },
                         child: Container(
                           height: 25,
                           width: 25,
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColors.btnColor),
                           child: const Icon(Icons.edit,color: Colors.black,size: 20),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: controller.name,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 13.5, color: AppColors.white),
                    // validator: (input) =>
                    // input!.isEmpty ? "Enter Your Name" : null,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white70),
                      fillColor: AppColors.btnColor,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      hintText: 'Enter Name',
                      labelText: '   Change Name',
                      labelStyle: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          // light
                          fontStyle: FontStyle.normal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColors.white,
                          )
                      ),
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: TextFormField(
                    initialValue:  box.read('email'),
                    readOnly: true,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 13.5, color: AppColors.white),
                    // validator: (input) =>
                    // input!.isEmpty ? "Enter Your Name" : null,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white70),
                      fillColor: AppColors.btnColor,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      hintText: 'Enter Email',
                      labelText: '   Change Email',
                      labelStyle: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          // light
                          fontStyle: FontStyle.normal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColors.white,
                          )),
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: TextFormField(
                    controller: controller.number,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 13.5, color: AppColors.white),
                    // validator: (input) =>
                    // input!.isEmpty ? "Enter Your Name" : null,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white70),
                      fillColor: AppColors.btnColor,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      hintText: 'Enter Number',
                      labelText: '   Enter Number',
                      labelStyle: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          // light
                          fontStyle: FontStyle.normal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColors.white,
                          )),
                    )
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(()=> const ChangePasswordPage());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.btnColor,
                    borderRadius: BorderRadius.circular(20),),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyWidgets.textView('      Change Password', Colors.white, 14),
                      const SizedBox(width: 15,),
                      Container(
                        height: 20,
                        width: 20,
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.arrow_forward_ios,size: 15),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 120),
                child: ElevatedButton(
                    style: curveButtonStyleThemeColor,
                    onPressed: () {
                      controller.editDetails(myBase64);
                    },
                    child: MyWidgets.textView("Submit", AppColors.white, 14,
                        fontWeight: FontWeight.bold)),
              )
            ],
          )
        ],
      ),
    );
  }

  var profileImage;
  String myBase64 = '';

  ImagePicker picker = ImagePicker();

  _getProfileImage() async {
    isSelecting = true;
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
      myBase64 = await convertImageToBase64(profileImage);
      print(myBase64);

    }
  }
  Future<String> convertImageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

}
