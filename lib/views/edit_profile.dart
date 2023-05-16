import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../styles/app_colors.dart';
import '../styles/button_style.dart';
import '../styles/commonmodule/my_widgets.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final box = GetStorage();

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
                    initialValue:  box.read('name'),
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
                          )),
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    initialValue:  box.read('email'),
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: TextFormField(
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
                      hintText: 'Enter Current Password',
                      labelText: '   Current Password',
                      labelStyle: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
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
                    textInputAction: TextInputAction.done,
                    style: TextStyle(fontSize: 13.5, color: AppColors.white),
                    // validator: (input) =>
                    // input!.isEmpty ? "Enter Your Name" : null,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white70),
                      fillColor: AppColors.btnColor,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      hintText: 'Enter New Password',
                      labelText: '   New Password',
                      labelStyle: const TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
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
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 120),
                child: ElevatedButton(
                    style: curveButtonStyleThemeColor,
                    onPressed: () {
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

  ImagePicker picker = ImagePicker();

  _getProfileImage() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 180,
      maxHeight: 180,
    );
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }
}
