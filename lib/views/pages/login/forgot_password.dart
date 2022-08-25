import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/helpers/validators/validators.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
import 'package:teresa/views/widgets/common_textfield/common_textfield.dart';
import '../../../constants/app_assets/app_asset.dart';
import '../../../constants/icons/app_icons.dart';
import '../../../constants/strings/app_strings.dart';
import '../../../controllers/login_controller/forgot_password_controller.dart';
import '../../../helpers/helperFunction/helperFunctions.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final forgotPasswordController = ForgotPasswordController();
  final helperFunction = HelperFunction();

  @override
  void initState() {
    forgotPasswordController.initializeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: Dimensions.height66,
            pinned: true,
            title: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Positioned.fill(
                  left: 0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        highlightColor: Colors.blue.withOpacity(0.4),
                        splashColor: Colors.green.withOpacity(0.5),
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: Dimensions.width40,
                          height: Dimensions.height40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(AppColors.WHITE),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(AppColors.GRAYISH_BLUE)
                                    .withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(
                                    1, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                AppIcons.PLAY_ARROW,
                                color: const Color(AppColors.STRONG_BLUE),
                                size: Dimensions.height24,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppAssets.appIcon,
                    height: Dimensions.height58,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
            elevation: 8,
            expandedHeight: Dimensions.height283,
            backgroundColor: const Color(AppColors.LIGHT_GRAYISH_BLUE),
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.height80,
                  ),
                  Opacity(
                      opacity: 0.3,
                      child: Center(
                          child: Image.asset(
                        AppAssets.loginSticker,
                        height: Dimensions.height181,
                        width: Dimensions.screenWidth,
                      )))
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (_, int index) {
              return ListTile(
                title: Column(
                  children: [
                    // const LoginSignupComponent(),
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
                            AppStrings.resetPassword,
                            style: TextStyle(
                                fontFamily: "Helvetica",
                                fontSize: Dimensions.height30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: Dimensions.height16,
                          ),
                          Text(
                            AppStrings.emailInstructionToResetPassword,
                            style: TextStyle(
                                fontFamily: "Helvetica",
                                fontSize: Dimensions.height16),
                          ),
                          Form(
                              key: forgotPasswordController.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTextField(
                                      name: "Email address",
                                      topPoint: Dimensions.height22,
                                      hintText: "Enter your email address",
                                      controller: forgotPasswordController
                                          .emailController,
                                      nullMessage:
                                          FormValidators.EMAIL_VALIDATION_TEXT,
                                      validationType: 1),
                                ],
                              )),
                          SizedBox(
                            height: Dimensions.height56,
                          ),
                          CommonButton(
                            name: AppStrings.send,
                            height: Dimensions.height45,
                            color: AppColors.MODERATE_BLUE,
                            width: double.maxFinite,
                            radius: Dimensions.radius8,
                            onPressed: () {
                              print('pressed reset');
                              if (forgotPasswordController.formKey.currentState!
                                  .validate()) {
                                Get.toNamed('/securityCode');
                              }
                            },
                            fontSize: Dimensions.height18,
                          ),
                          SizedBox(
                            height: Dimensions.height32,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ))
        ],
      ),
    ));
  }
}
