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

import '../../../controllers/login_controller/change_password_controller.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final changePasswordController = ChangePasswordController();
  final helperFunction = HelperFunction();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changePasswordController.initializeController();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                titleSpacing: 80,
                toolbarHeight: Dimensions.height66,
                pinned: true,
                leading: Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: Dimensions.width36,
                  height: Dimensions.height36,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(AppColors.WHITE),
                  ),
                  child: RotatedBox(
                      quarterTurns: 2,
                      child: IconButton(
                        icon: Icon(
                          Icons.play_arrow,
                          color: const Color(AppColors.MODERATE_BLUE),
                          size: Dimensions.height20,
                        ),
                        onPressed: () {},
                      )),
                ),
                elevation: 8,
                expandedHeight: Dimensions.height130,
                backgroundColor: const Color(AppColors.WHITE),
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    AppStrings.changePassword,
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        color: Colors.black,
                        fontSize: Dimensions.height20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                        (_, int index) {
                      return ListTile(
                        title: Form(
                          key: changePasswordController.formKey,
                          child: Column(
                            children: [
                              // const LoginSignupComponent(),
                              PasswordTextField(
                                obscure: helperFunction.passwordShowHide,
                                name: AppStrings.currentPassword,
                                topPoint: Dimensions.height22,
                                hintText: AppStrings.currentPasswordHint,
                                controller: changePasswordController.changePasswordController,
                                nullMessage: FormValidators.currentPasswordText,
                                lengthMessage: FormValidators.PASSWORD_LENGTH_VALIDATION,
                              ),
                              PasswordTextField(
                                obscure: helperFunction.passwordShowHide,
                                name: AppStrings.newPassword,
                                topPoint: Dimensions.height22,
                                hintText: AppStrings.newPasswordHint,
                                controller: changePasswordController.newPasswordController,
                                nullMessage: FormValidators.newPasswordText,
                                lengthMessage: FormValidators.PASSWORD_LENGTH_VALIDATION,
                              ),
                              PasswordTextField(
                                obscure: helperFunction.passwordShowHide,
                                name: AppStrings.confirmPassword,
                                topPoint: Dimensions.height22,
                                hintText: AppStrings.confirmPasswordHint,
                                controller: changePasswordController.confirmPasswordController,
                                nullMessage: FormValidators.CONFIRM_PASSWORD_VALIDATION_TEXT,
                                lengthMessage: FormValidators.CONFIRM_PASSWORD_LENGTH_VALIDATION,
                              ),
                              SizedBox(
                                height: Dimensions.height56,
                              ),
                              CommonButton(
                                name: AppStrings.goOn,
                                height: Dimensions.height45,
                                color: AppColors.MODERATE_BLUE,
                                width: double.maxFinite,
                                radius: Dimensions.radius8,
                                onPressed: () {
                                  if (changePasswordController.formKey.currentState!
                                      .validate()) {
                                    Get.toNamed('/createNewPassword');
                                  }
                                },
                                fontSize: Dimensions.height18,
                              ),


                            ],
                          ),
                        ),
                      );
                    },
                  ))
            ],
          ),

      ),
    );
  }
}
