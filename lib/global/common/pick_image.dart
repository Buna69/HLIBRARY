import 'package:flutter/material.dart';
import 'package:hlibrary/global/common/toast.dart';
import 'package:image_picker/image_picker.dart';

pickImage(imageSource)async{
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source:imageSource);
  if(file != null){
    return await file.readAsBytes();
  } 
showToast(message: "No image selected.");
}