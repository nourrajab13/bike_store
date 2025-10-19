import 'dart:io';

import 'package:bikestore/features/profile/data_layer/profile_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{
  Rx<TextEditingController> nameController=TextEditingController().obs;
  Rx<TextEditingController> phoneController=TextEditingController().obs;
  Rx<TextEditingController> emailController=TextEditingController().obs;
  RxString isSelected='Male'.obs;
  RxList<Profile>profileList=<Profile>[
    Profile(name: '', email: '', gander: '', phoneNum: '')
  ].obs;

  var selectedImage = Rx<File?>(null);


Future<void> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    selectedImage.value = File(image.path);
  }
}


}


