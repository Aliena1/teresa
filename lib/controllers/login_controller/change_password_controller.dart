import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teresa/helpers/connection/connection.dart';
import 'package:teresa/models/sign_up_model/sign_up_model.dart';
import 'package:teresa/repository/sign_up_repository/sign_up_repository.dart';
import 'package:teresa/views/dialogs/check_mail_dialog/check_mail_dialog.dart';
import 'package:teresa/views/dialogs/loader/loader_dialog.dart';
import 'package:teresa/views/dialogs/no_internet_connection_dialog/no_internet_connection_dialog.dart';

class ChangePasswordController{
  late TextEditingController changePasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  final formKey = GlobalKey<FormState>();

  void initializeController(){
    changePasswordController=TextEditingController();
    newPasswordController=TextEditingController();
    confirmPasswordController=TextEditingController();

  }

  // void registerUser(context) async{
  //   try{
  //     await ConnectionChecker.isInternet().then((value) async{
  //       if(value){
  //         var map={
  //           "username":usernameController.text,
  //           "surname":surnameController.text,
  //           "first_name":firstNameController.text,
  //           "dob":date.value,
  //           "email":emailController.text,
  //           "mobile_number":mobileController.text,
  //           "password":passwordController.text,
  //           "c_password":confirmPasswordController.text
  //         };
  //         removeValidationList();
  //         Loading().showLoading("Submitting");
  //         await signUpRepo.registerUser(map).then((value) {
  //           final response=SignUpResponse.fromJson(value);
  //           // if(response.errors!=null){
  //           //   usernameValidation.value=response.errors["username"]!=null?List.from(response.errors["username"].map((x) => x)):[];
  //           //   mobileNoValidation.value=response.errors["mobile_number"]!=null?List.from(response.errors["mobile_number"].map((x) => x)):[];
  //           //   passwordValidation.value=response.errors["c_password"]!=null?List.from(response.errors["c_password"].map((x) => x)):[];
  //           //   emailValidation.value=response.errors["email"]!=null?List.from(response.errors["email"].map((x) => x)):[];
  //           // }
  //           if(response.status=="true"){
  //             Loading().hideLoading();
  //             checkMailDialog(context,response.message.toString());
  //             clearController();
  //           }
  //           else{
  //
  //           }
  //           Loading().hideLoading();
  //         }
  //
  //         );
  //       }
  //       else{
  //         Loading().hideLoading();
  //         internetConnectionDialog(context);
  //       }
  //     });
  //   }
  //   catch(e){
  //     Loading().hideLoading();
  //     throw Exception(e.toString());
  //   }
  // }

}