import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/helpers/connection/connection.dart';
import 'package:teresa/helpers/helperFunction/helperFunctions.dart';
import 'package:teresa/models/login_model/login_model.dart';
import 'package:teresa/repository/login_repository/login_repository.dart';
import 'package:teresa/views/dialogs/loader/loader_dialog.dart';
import 'package:teresa/views/dialogs/no_internet_connection_dialog/no_internet_connection_dialog.dart';
import 'package:teresa/views/pages/bottom_navigation/bottom_navigation.dart';

class LoginController{
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  RxBool  isChecked=false.obs;
  final loginRepo=LoginRepository();
  final helperFunction=HelperFunction();

  initializeController() async {
    usernameController=TextEditingController();
    passwordController=TextEditingController();

  }


  disposeController(){
    usernameController.dispose();
    passwordController.dispose();
  }


  clearController(){
    usernameController.clear();
    passwordController.clear();
  }

  void getUsername() async{
    // final prefs=await SharedPreferences.getInstance();
    // if(prefs.getBool("isChecked")==true){
    //   isChecked.value=true;
    //   usernameController.text=prefs.getString("loginUsername")!;
    // }
    final prefs=await SharedPreferences.getInstance();
    var isLogout = prefs.getString("logout");
    var rememberMe = prefs.getString("rememberMe");

    if(isLogout=="true" && rememberMe=="true"){

      // helperFunction.getPreference("remUsername").then((value) {
       var username = prefs.getString("remUsername");
        var password = prefs.getString("remPassword");

        usernameController.text = username!;
        passwordController.text = password!;
      // });


    }
  }



  void login(context) async{
    final prefs=await SharedPreferences.getInstance();
    try{
      var map={
        "username":usernameController.text,
        "password":passwordController.text
      };
      await ConnectionChecker.isInternet().then((value) async{
        if(value){
          Loading().showLoading("logging");
          await loginRepo.login(map).then((value) {
            final response=LoginResponse.fromJson(value);
            if(response.status==true){
              ApiConstants.TOKEN=response.accessToken!;
              ApiConstants.TOKEN_TYPE=response.tokenType!;

              saveValues(response);

              prefs.setString("userDetail", jsonEncode(value["userDetails"]));
              prefs.remove("logout");

              helperFunction.getUserDetail();

              if(isChecked.value){
                helperFunction.setPreference("rememberMe", "${isChecked.value}");


                // prefs.setBool("isChecked", isChecked.value);
                // prefs.setString("loginUsername", usernameController.text);
                // prefs.setString("password", passwordController.text);
              }
              else {

                // if(prefs.getBool("isChecked")!=null && prefs.getString("loginUsername")!=null){
                  prefs.remove("rememberMe");
                //   prefs.remove("loginUsername");
                // }
              }

              Loading().hideLoading();
              Get.offAllNamed('/home');
            }
            else{
              Loading().hideLoading();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: const Color(AppColors.STRONG_BLUE),
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                  response.message.toString()
                )));
            }
          });
        }
        else{
          internetConnectionDialog(context);
        }
      });
    }
    catch(e){
      Loading().hideLoading();
      throw Exception(e.toString());
    }
  }

  void saveValues(LoginResponse response) {
    helperFunction.setPreference("username", response.userDetails!.username.toString());
    helperFunction.setPreference("password", passwordController.text);
    helperFunction.setPreference("address", response.userDetails!.address.toString());
    helperFunction.setPreference("profileImage", response.userDetails!.profileImage.toString());

  }

}