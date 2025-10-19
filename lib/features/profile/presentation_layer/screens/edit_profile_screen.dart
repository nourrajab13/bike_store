import 'package:bikestore/core/const/app_colors.dart';
import 'package:bikestore/core/const/app_text.dart';
import 'package:bikestore/features/profile/business_logic_layer/profile_controller.dart';
import 'package:bikestore/features/profile/data_layer/profile_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  ProfileController profileController = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColors.backgroundColor,
        title: AppText.spicyRice('Edit Profile', AppColors.blackColor, 30),
        leading: IconButton(onPressed: () {
          Get.back();
        } ,icon: Icon(Icons.arrow_back_ios_new,color: AppColors.blackColor,size: 30,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.spicyRice('Your Name', AppColors.blackColor, 20),
            ),
            Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: TextFormField(
              controller: profileController.nameController.value,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(23)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(23)),
                hint: Text('Nour rajab',style: TextStyle(color: Color(0xffb3b3b3)),),
                filled: true,
                fillColor: Color(0xffe1e1e1)
              ),
            ),),
            SizedBox(height: 25,),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.spicyRice('Gender', AppColors.blackColor, 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonFormField<String>(
                initialValue: profileController.isSelected.value,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(23)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(23)),
                  filled: true,
                  fillColor: Color(0xffe1e1e1),
                  hint: Text('Male',style: TextStyle(color: Color(0xffb3b3b3)),),
                ),
                items: [
                DropdownMenuItem(value: 'Male',child: Text('Male'),),
                DropdownMenuItem(value: 'Female',child: Text('Female')),
              ], onChanged: (value) {
                profileController.isSelected.value!=value;
              },),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.spicyRice('Phone Number', AppColors.blackColor, 20),
            ),
            Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: profileController.phoneController.value,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(23)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(23)),
                hint: Text('0942205029',style: TextStyle(color: Color(0xffb3b3b3)),),
                filled: true,
                fillColor: Color(0xffe1e1e1)
              ),
            ),),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText.spicyRice('Your Email', AppColors.blackColor, 20),
            ),
            Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: profileController.emailController.value,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(23)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(23)),
                hint: Text('nour@gmail.com',style: TextStyle(color: Color(0xffb3b3b3)),),
                filled: true,
                fillColor: Color(0xffe1e1e1)
              ),
            ),),
            SizedBox(height: 40,),
            Center(
              child: InkWell(
                onTap: () {
                    profileController.profileList.clear();
                    profileController.profileList.add(Profile(
                    name: profileController.nameController.value.text,
                    email: profileController.emailController.value.text, 
                    gander: profileController.isSelected.value,
                    phoneNum: profileController.phoneController.value.text
                  ));
                  profileController.emailController.value.clear();
                  profileController.nameController.value.clear();
                  profileController.phoneController.value.clear();
                  profileController.isSelected.value='Male';
                  Get.back();
                },
                child: Container(
                  height: 60,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: AppColors.blackColor
                  ),
                  child: AppText.spicyRice('Save', AppColors.whiteColor, 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}