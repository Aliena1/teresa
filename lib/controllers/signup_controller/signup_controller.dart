import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teresa/helpers/connection/connection.dart';
import 'package:teresa/models/sign_up_model/sign_up_model.dart';
import 'package:teresa/repository/sign_up_repository/sign_up_repository.dart';
import 'package:teresa/views/dialogs/check_mail_dialog/check_mail_dialog.dart';
import 'package:teresa/views/dialogs/loader/loader_dialog.dart';
import 'package:teresa/views/dialogs/no_internet_connection_dialog/no_internet_connection_dialog.dart';

class SignUpController{
  late TextEditingController firstNameController;
  late TextEditingController surnameController;
  late TextEditingController emailController;
  late TextEditingController mobileController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  final formKey = GlobalKey<FormState>();
  RxString date="".obs;
  final signUpRepo=SignUpRepository();
  RxList errors=[].obs;
  RxList emailValidation=[].obs;
  RxList mobileNoValidation=[].obs;
  RxList usernameValidation=[].obs;
  RxList passwordValidation=[].obs;
  RxBool isDateSelected=false.obs;

  void initializeController(){
    firstNameController=TextEditingController();
    surnameController=TextEditingController();
    emailController=TextEditingController();
    usernameController=TextEditingController();
    passwordController=TextEditingController();
    confirmPasswordController=TextEditingController();
    mobileController=TextEditingController();
  }

  void disposeController(){
    firstNameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    mobileController.dispose();
    date.value="";
  }

  void clearController(){
    firstNameController.clear();
    surnameController.clear();
    emailController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    mobileController.clear();
    date.value="";
  }


  void registerUser(context) async{
    try{
      await ConnectionChecker.isInternet().then((value) async{
        if(value){
          var map={
            "username":usernameController.text,
            "surname":surnameController.text,
            "first_name":firstNameController.text,
            "dob":date.value,
            "email":emailController.text,
            "mobile_number":mobileController.text,
            "password":passwordController.text,
            "c_password":confirmPasswordController.text
          };
          removeValidationList();
          Loading().showLoading("Submitting");
          await signUpRepo.registerUser(map).then((value) {
            final response=SignUpResponse.fromJson(value);
            if(response.errors!=null){
              usernameValidation.value=response.errors["username"]!=null?List.from(response.errors["username"].map((x) => x)):[];
              mobileNoValidation.value=response.errors["mobile_number"]!=null?List.from(response.errors["mobile_number"].map((x) => x)):[];
              passwordValidation.value=response.errors["c_password"]!=null?List.from(response.errors["c_password"].map((x) => x)):[];
              emailValidation.value=response.errors["email"]!=null?List.from(response.errors["email"].map((x) => x)):[];
            }
            if(response.status=="true"){
              Loading().hideLoading();
              checkMailDialog(context,response.message.toString());
              clearController();
            }
            Loading().hideLoading();
          }

          );
        }
        else{
          Loading().hideLoading();
          internetConnectionDialog(context);
        }
      });
    }
    catch(e){
      Loading().hideLoading();
      throw Exception(e.toString());
    }
  }


  void removeValidationList(){
    usernameValidation.clear();
    mobileNoValidation.clear();
    passwordValidation.clear();
    emailValidation.clear();
  }

  Future<void> dateOfBirth(context) async {
    final DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 7),
        lastDate: DateTime.now(),
        helpText: 'Select a date',
        fieldHintText: "dkdsknjk"
    ).then((selectedDate) {
      if (selectedDate != null) {
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formatted = formatter.format(selectedDate);
        date.value=formatted;
        isDateSelected.value=false;
      }
    });
  }




}