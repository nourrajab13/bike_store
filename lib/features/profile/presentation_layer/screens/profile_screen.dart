import 'package:bikestore/core/const/app_colors.dart';
import 'package:bikestore/core/const/app_text.dart';
import 'package:bikestore/features/profile/business_logic_layer/profile_controller.dart';
import 'package:bikestore/features/profile/presentation_layer/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
 
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
       appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColors.backgroundColor,
        title: AppText.spicyRice('My Profile', AppColors.blackColor, 30),
        leading: Icon(Icons.person_2_outlined,color: AppColors.blackColor,size: 30,),
      ),
      body: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.yellowColor,
                    radius: 50,
                    child: Obx((){
                        
                        return CircleAvatar(
                          backgroundImage: profileController.selectedImage.value == null
                          ?AssetImage('assets/images/a/user.png')
                          :FileImage(profileController.selectedImage.value!),
                          radius: 47,
                        );
                      }
                    ),
                  ),
                  Positioned(
                    bottom: 0, right: 0,
                    child: InkWell(
                      onTap: () {
                        profileController.pickImage();
                      },
                      child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.yellowColor
                      ),
                      child: Icon(Icons.edit),
                      ),
                    ))
                ],
              ),
              Obx((){
                  return AppText.spicyRice(profileController.profileList[0].name, AppColors.blackColor, 26);
                }
              ),
              Obx((){
                  return AppText.pacifico(profileController.profileList[0].email, AppColors.blackColor, 14);
                }
              ),
            ],
          ),
          SizedBox(height: 30,),
          ListTile(
            onTap: () {
              Get.to(EditProfileScreen());
            },
            title: Text('Edit Profile'),
            leading: Icon(Icons.edit_outlined),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
             onTap: () {
            },
            title: Text('Notfication'),
            leading: Icon(Icons.edit_notifications_outlined),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
             onTap: () {
            },
            title: Text('Your Address'),
            leading: Icon(Icons.person_pin_circle_outlined),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
             onTap: () {
            },
            title: Text('Contact Us'),
            leading: Icon(Icons.wechat_outlined),
            trailing: Icon(Icons.arrow_forward_ios),
          )

        ],
      ),
    );
  }
}