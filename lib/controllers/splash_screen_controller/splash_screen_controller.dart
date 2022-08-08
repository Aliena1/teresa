import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/models/login_model/login_model.dart';
import 'package:teresa/services/remote_services/remote_services.dart';
import 'package:teresa/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:teresa/views/pages/login/login.dart';

import '../../helpers/helperFunction/helperFunctions.dart';
class SplashScreenController{
  final helperFunction = HelperFunction();

  Future<void> check() async{
    final prefs=await SharedPreferences.getInstance();
    if(prefs.getString("username")!=null && prefs.getString("password")!=null){
      var map={
        "username": prefs.getString("username"),
        "password":prefs.getString("password")
      };
      await RemoteServices.postMethod(ApiConstants.LOGIN, map).then((value) {
        final response=LoginResponse.fromJson(value);
        ApiConstants.TOKEN=response.accessToken!;
        ApiConstants.TOKEN_TYPE=response.tokenType!;
        if(response.status==true){
          Get.offAllNamed('/home');
        }else{
          Get.offAllNamed('/login');
        }
      });
    }
    else{
      Get.offAllNamed('/login');
    }
  }
}