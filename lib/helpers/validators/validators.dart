import 'package:get/get.dart';
import 'package:teresa/constants/strings/app_strings.dart';
class FormValidators{
  static const USERNAME_VALIDATION_TEXT= "Please enter your username";
  static const USERNAME_EMAIL_VALIDATION_TEXT="Please enter your username or email address";
  static const FIRST_NAME_VALIDATION_TEXT="Please enter your first name";
  static const SURNAME_VALIDATION_TEXT="Please enter your surname";
  static const DATE_VALIDATION_TEXT="Please select your date of birth";
  static const EMAIL_VALIDATION_TEXT="Please enter your email address";
  static const securityCode="Please enter the security code";
  static const currentPasswordText = "Please enter current password";
  static const newPasswordText= "Please enter new password";
  static const MOBILE_NO_VALIDATION_TEXT="Please enter your mobile number";
  static const PASSWORD_VALIDATION_TEXT="Please enter your password";
  static const CONFIRM_PASSWORD_VALIDATION_TEXT="Please confirm your password";
  static const VALID_EMAIL_VALIDATION_TEXT="Please enter valid email address";
  static const VALID_MOBILE_VALIDATION_TEXT="Please enter valid mobile Number";
  static const PASSWORD_LENGTH_VALIDATION="The password must be at least 8 characters.";
  static const CONFIRM_PASSWORD_LENGTH_VALIDATION="The confirm password must be at least 8 characters.";


  static validateFormField(value,nullMessage){
    if (value == null || value.isEmpty) {
      return nullMessage;
    } else {
      return null;
    }
  }

  static validatePassword(value,nullMessage,lengthMessage){

    if (value == null || value.isEmpty) {
      return nullMessage;
    }
    else if(value.length<8){
      return lengthMessage;
    }
    else {
      return null;
    }
  }

  static validateMobileFormField(value,nullMessage){
    if (value == null || value.isEmpty) {
      return nullMessage;
    }
    else if(!GetUtils.isPhoneNumber(value)) {
      return VALID_MOBILE_VALIDATION_TEXT;
    }
    else {
      print(!GetUtils.isPhoneNumber(value));
      return null;
    }
  }

  static validateEmailFormField(value,nullMessage){
    if (value == null || value.isEmpty ) {
      return nullMessage;
    }
    else if(!GetUtils.isEmail(value)) {
      return VALID_EMAIL_VALIDATION_TEXT;
    } else {
      return null;
    }
  }
}