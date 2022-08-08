import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teresa/models/login_model/login_model.dart';
class HomeController extends GetxController{
  RxInt selected=0.obs;
  PageController pageController = PageController();
  var userDetails;

  @override
  void onInit() {
    getUserDetail();
    super.onInit();
  }


  void getUserDetail() async{
    final prefs=await SharedPreferences.getInstance();
    var temp=jsonDecode(prefs.getString("userDetail")!);
    userDetails=UserDetails.fromJson(temp);
  }
  
  
  
  void changeTab(index){
    selected.value=index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 600), curve: Curves.fastLinearToSlowEaseIn);
  }
}