import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:get/get.dart';
import 'package:teresa/constants/strings/app_strings.dart';
import 'package:teresa/controllers/login_controller/login_controller.dart';
import 'package:teresa/helpers/helperFunction/helperFunctions.dart';
import 'package:teresa/helpers/validators/validators.dart';
import 'package:teresa/views/pages/Signup/signup.dart';
import 'package:teresa/views/pages/bottom_navigation/bottom_navigation.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
import 'package:teresa/views/widgets/common_textfield/common_textfield.dart';
import 'package:teresa/views/widgets/login_signup_component/login_signup_component.dart';
import 'package:teresa/views/widgets/password_textfield/password_textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginController = LoginController();
  final helperFunction = HelperFunction();


  @override
  void initState(){
      loginController.initializeController();
    loginController.getUsername();
    super.initState();
  }

  @override
  void dispose(){
    loginController.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
          // reverse: true,
      child: Column(
        children: [
          const LoginSignupComponent(type: "login"),
          Padding(
            padding: EdgeInsets.only(
                top: Dimensions.height16,
                left: Dimensions.width25,
                right: Dimensions.width25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.height16,
                ),
                Text(
                  AppStrings.signInTeresa,
                  style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: Dimensions.height30,
                      fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(
                  height: Dimensions.height17,
                ),
                CommonButton(
                  width: double.maxFinite,
                  height: Dimensions.height45,
                  name: AppStrings.signUpNow,
                  color: AppColors.STRONG_CYAN,
                  radius: Dimensions.radius8,
                  onPressed: () {
                    // Get.to(() => SignUp());
                    Get.toNamed('/signUp');
                  },
                  fontSize: Dimensions.height18,
                ),
                SizedBox(
                  height: Dimensions.height12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 0.37 * Dimensions.screenWidth,
                      height: Dimensions.height2,
                      color: const Color(AppColors.STRONG_CYAN),
                    ),
                    Text(
                      "Or",
                      style: TextStyle(
                          fontFamily: "Helvetica",
                          fontSize: Dimensions.height15,
                          color: const Color(AppColors.STRONG_CYAN)),
                    ),
                    Container(
                      width: 0.37 * Dimensions.screenWidth,
                      height: Dimensions.height2,
                      color: const Color(AppColors.STRONG_CYAN),
                    ),
                  ],
                ),
                Form(
                    key: loginController.formKey,
                    child: Column(
                      children: [
                        CommonTextField(
                          name: AppStrings.username,
                          hintText: AppStrings.hintUsername,
                          topPoint: Dimensions.height30,
                          nullMessage:
                              FormValidators.USERNAME_EMAIL_VALIDATION_TEXT,
                          controller: loginController.usernameController,
                        ),
                        PasswordTextField(
                          obscure: helperFunction.passwordShowHide,
                          name: AppStrings.password,
                          hintText: AppStrings.hintPassword,
                          topPoint: Dimensions.height36,
                          nullMessage:
                              FormValidators.PASSWORD_VALIDATION_TEXT,
                          controller: loginController.passwordController,
                        ),

                      ],
                    )),
                SizedBox(
                  height: Dimensions.height23,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: (){
                      Get.toNamed('/forgotPassword');
                    },
                    child: Text(
                      AppStrings.forgotPassword,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(

                          fontFamily: "Helvetica",
                          fontSize: Dimensions.height14,
                          decoration: TextDecoration.underline,
                          color: const Color(AppColors.MODERATE_BLUE)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: loginController.isChecked.value,
                          onChanged: (value) {
                            loginController.isChecked.value=value!;
                          }),
                    ),
                    Text(
                      AppStrings.rememberMe,
                      style: TextStyle(
                          fontFamily: "Helvetica",
                          fontSize: Dimensions.height14),
                    )
                  ],
                ),
                SizedBox(
                  height: Dimensions.height29,
                ),
                CommonButton(
                  height: Dimensions.height45,
                  width: double.maxFinite,
                  name: AppStrings.signIn,
                  color: AppColors.MODERATE_BLUE,
                  radius: Dimensions.radius8,
                  onPressed: () {
                    if(loginController.formKey.currentState!.validate()){
                      loginController.login(context);
                    }
                  },
                  fontSize: Dimensions.height18,
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
              ],
            ),
          ),
        ],
      ),
        ),

      ),
    );
  }
}
