
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teresa/models/login_model/login_model.dart';

class HelperFunction{

  // password visibility
  var passwordShowHide = true.obs;
  void showHidePassword(password){
    password.value = !password.value;
  }

  RxBool isLoading=false.obs;
  var userDetails=UserDetails();
  void getUserDetail() async{
    isLoading(true);
    final prefs=await SharedPreferences.getInstance();
    var temp=jsonDecode(prefs.getString("userDetail")!);
    userDetails=UserDetails.fromJson(temp);
    isLoading(false);
  }


  void setPreference(String key,String value) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key,value);
  }

  Future<String> getPreference(String key) async{
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.get(key).toString();
    print('get value username='+value);
    return value;
  }

  logout() async{
    final prefs = await SharedPreferences.getInstance();
    var username = prefs.getString("username");
    var password = prefs.getString("password");
    setPreference("remUsername", username!);
    setPreference("remPassword", password!);
    prefs.remove('username');
    prefs.remove('password');
    // prefs.clear();
    setPreference("logout", "true");
    Get.offAllNamed('/login');
  }

}