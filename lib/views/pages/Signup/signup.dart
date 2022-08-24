import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/controllers/signup_controller/signup_controller.dart';
import 'package:teresa/helpers/validators/validators.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
import 'package:teresa/views/widgets/common_textfield/common_textfield.dart';
import 'package:teresa/views/widgets/login_signup_component/login_signup_component.dart';
import 'package:teresa/views/widgets/password_textfield/password_textfield.dart';
import 'package:get/get.dart';

import '../../../constants/strings/app_strings.dart';
import '../../../helpers/helperFunction/helperFunctions.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final signupController=SignUpController();
  final helperFunction = HelperFunction();

  @override
  void initState() {
    signupController.initializeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginSignupComponent(),
            SizedBox(
              height: Dimensions.height19,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width21, right: Dimensions.width21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Registration",
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        fontSize: Dimensions.height40,
                        fontWeight: FontWeight.bold),
                  ),
                  Form(
                      key: signupController.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextField(
                        name: "First name",
                        topPoint: Dimensions.height35,
                        hintText: "Enter first name",
                        controller: signupController.firstNameController,
                        nullMessage: FormValidators.FIRST_NAME_VALIDATION_TEXT,

                      ),
                      CommonTextField(
                        name: "Surname",
                        topPoint: Dimensions.height22,
                        hintText: "Enter surname",
                        controller: signupController.surnameController,
                        nullMessage: FormValidators.SURNAME_VALIDATION_TEXT,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Dimensions.height22,
                          ),
                          Text("Date of birth",style: TextStyle(
                              fontFamily: "Helvetica",
                              fontSize: Dimensions.height12
                          ),),
                          SizedBox(
                            height: Dimensions.height9,
                          ),
                          GestureDetector(
                            onTap: (){
                              signupController.dateOfBirth(context);
                            },
                            child: Container(
                              height: Dimensions.height32,
                              width: Dimensions.width196,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Dimensions.radius19)),
                                color: const Color(AppColors.WHITE),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset:
                                    const Offset(0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.calendar_month_outlined,
                                      size: Dimensions.height14,
                                      color: const Color(AppColors.DARK_GRAY)),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  Obx(() => Text(signupController.date.value.isEmpty?"Enter Date of birth":signupController.date.value,
                                      style: TextStyle(
                                          fontFamily: "Helvetica",
                                          fontSize: Dimensions.height12,
                                          color: const Color(AppColors.DARK_GRAY))))
                                ],
                              ),
                            ),
                          ),
                          Obx(() => Visibility(
                              visible: signupController.isDateSelected.value?true:false,
                              child: Padding(
                                padding: EdgeInsets.only(top: Dimensions.height10,left: Dimensions.width5),
                                child: Text(AppStrings.selectDate,style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: Dimensions.height10,
                                ),),
                              )),),
                        ],
                      ),
                      CommonTextField(
                          name: "Email address",
                          topPoint: Dimensions.height22,
                          hintText: "Enter your email address",
                          controller: signupController.emailController,
                          nullMessage: FormValidators.EMAIL_VALIDATION_TEXT,
                          validationType:1
                      ),
                      Obx(() => Visibility(
                          visible: signupController.emailValidation.isEmpty?false:true,
                          child: Padding(
                            padding: EdgeInsets.only(top: Dimensions.height5),
                            child: Text(signupController.emailValidation.isEmpty?"":signupController.emailValidation[0].toString(),
                              style: TextStyle(
                                color: Colors.red.shade700,
                                fontSize: Dimensions.height10,
                              ),),
                          )),),
                      CommonTextField(
                          name: AppStrings.mobileNo,
                          topPoint: Dimensions.height22,
                          hintText: AppStrings.hintMobileNo,
                          controller: signupController.mobileController,
                          nullMessage: FormValidators.MOBILE_NO_VALIDATION_TEXT,
                          validationType:2               ),
                      Obx(() => Visibility(
                        visible: signupController.mobileNoValidation.isEmpty?false:true,
                        child: Padding(
                          padding: EdgeInsets.only(top: Dimensions.height5),
                          child: Text(signupController.mobileNoValidation.isEmpty?"":signupController.mobileNoValidation[0].toString(),style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: Dimensions.height10,
                          ),),
                        ),),),
                      CommonTextField(
                        name: "Username",
                        topPoint: Dimensions.height22,
                        hintText: "Enter username",
                        controller: signupController.usernameController,
                        nullMessage: FormValidators.USERNAME_VALIDATION_TEXT,
                      ),
                      Obx(() => Visibility(
                        visible: signupController.usernameValidation.isEmpty?false:true,
                        child: Padding(
                          padding: EdgeInsets.only(top: Dimensions.height5),
                          child: Text(signupController.usernameValidation.isNotEmpty?signupController.usernameValidation[0]:"",style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: Dimensions.height10,
                          ),),
                        ),),),
                      PasswordTextField(
                        obscure: helperFunction.passwordShowHide,
                        name: AppStrings.password,
                        topPoint: Dimensions.height22,
                        hintText: AppStrings.hintPassword,
                        controller: signupController.passwordController,
                        nullMessage: FormValidators.PASSWORD_VALIDATION_TEXT,
                        lengthMessage: FormValidators.PASSWORD_LENGTH_VALIDATION,
                      ),
                      Obx(() => Visibility(
                        visible: signupController.passwordValidation.isEmpty?false:true,
                        child: Padding(
                          padding: EdgeInsets.only(top: Dimensions.height5),
                          child: Text(signupController.passwordValidation.isEmpty?"":signupController.passwordValidation[0].toString(),style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: Dimensions.height10,
                          ),),
                        ),),),
                      PasswordTextField(
                        obscure: helperFunction.passwordShowHide,
                        name: AppStrings.confirmPassword,
                        topPoint: Dimensions.height22,
                        hintText: AppStrings.confirmPasswordHint,
                        controller: signupController.confirmPasswordController,
                        nullMessage: FormValidators.CONFIRM_PASSWORD_VALIDATION_TEXT,
                        lengthMessage: FormValidators.CONFIRM_PASSWORD_LENGTH_VALIDATION,
                      ),
                      Obx(() => Visibility(
                        visible: signupController.passwordValidation.isEmpty?false:true,
                        child: Padding(
                          padding: EdgeInsets.only(top: Dimensions.height5),
                          child: Text(signupController.passwordValidation.isEmpty?"":signupController.passwordValidation[0].toString(),style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: Dimensions.height10,
                          ),),
                        ),),)
                    ],
                  )),
                  SizedBox(
                    height: Dimensions.height56,
                  ),
                  CommonButton(
                    name: AppStrings.signUp,
                    height: Dimensions.height45,
                    color: AppColors.MODERATE_BLUE,
                    width: double.maxFinite,
                    radius: Dimensions.radius8,
                    onPressed: (){

                      if (signupController.formKey.currentState!.validate()) {
                        if(signupController.date.value==""){
                          signupController.isDateSelected.value=true;
                          return;
                        }
                        FocusScope.of(context).unfocus();
                        signupController.registerUser(context);
                      }
                    },
                    fontSize: Dimensions.height18,
                  ),
                  SizedBox(
                    height: Dimensions.height32,
                  ),
                  CommonButton(
                    name: "Cancel",
                    height: Dimensions.height45,
                    color: AppColors.STRONG_CYAN,
                    width: double.maxFinite,
                    radius: Dimensions.radius8,
                    onPressed: (){
                      Get.back();
                    },
                    fontSize: Dimensions.height18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
