import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/helpers/validators/validators.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
import 'package:teresa/views/widgets/common_textfield/common_textfield.dart';
import 'package:teresa/views/widgets/login_signup_component/login_signup_component.dart';
import '../../../constants/app_assets/app_asset.dart';
import '../../../constants/icons/app_icons.dart';
import '../../../constants/strings/app_strings.dart';
import '../../../controllers/login_controller/forgot_password_controller.dart';
import '../../../controllers/login_controller/security_code_controller.dart';
import '../../../helpers/helperFunction/helperFunctions.dart';

class SecurityCode extends StatefulWidget {
  const SecurityCode({Key? key}) : super(key: key);

  @override
  State<SecurityCode> createState() => _SecurityCodeState();
}

class _SecurityCodeState extends State<SecurityCode> {
  final securityCodeController = SecurityCodeController();
  // final helperFunction = HelperFunction();

  @override
  void initState() {
    securityCodeController.initializeController();
    super.initState();
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
                  shape: BoxShape.circle, color: Color(AppColors.WHITE)),
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
            expandedHeight: Dimensions.height283,
            backgroundColor: const Color(AppColors.LIGHT_GRAYISH_BLUE),
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                AppStrings.securityCode,
                style: TextStyle(
                    fontFamily: "Helvetica",
                    color: Colors.black,
                    fontSize: Dimensions.height20,
                    fontWeight: FontWeight.bold),
              ),
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

                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.width21, right: Dimensions.width21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Dimensions.height16,
                          ),
                          Text(
                            AppStrings.securityMsg,
                            style: TextStyle(
                                fontFamily: "Helvetica",
                                fontSize: Dimensions.height16),
                          ),
                          Form(
                              key: securityCodeController.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTextField(
                                      name: "Code",
                                      topPoint: Dimensions.height22,
                                      hintText: "Enter the security code",
                                      controller:
                                          securityCodeController.codeController,
                                      nullMessage: FormValidators.securityCode,
                                      validationType: 0),
                                ],
                              )),
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
                              if (securityCodeController.formKey.currentState!
                                  .validate()) {
                                Get.toNamed('/createNewPassword');
                              }
                            },
                            fontSize: Dimensions.height18,
                          ),
                          SizedBox(
                            height: Dimensions.height32,
                          ),
                          Row(children: <Widget>[
                            Expanded(
                                child: Divider(
                              color: const Color(AppColors.STRONG_CYAN),
                            )),
                            Text(
                              AppStrings.securityCodeMsg,
                              style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontSize: Dimensions.height15,
                                  color: const Color(AppColors.STRONG_CYAN)),
                            ),
                            Expanded(
                                child: Divider(
                              color: const Color(AppColors.STRONG_CYAN),
                            )),
                          ]),
                          SizedBox(
                            height: Dimensions.height32,
                          ),
                          Row(
                            children: [
                              Text(
                                AppStrings.resendCode,
                                style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontSize: Dimensions.height18,
                                    color:
                                        const Color(AppColors.MODERATE_BLUE)),
                              ),
                              const Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Color(AppColors.MODERATE_BLUE),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height24,
                          ),
                          Row(
                            children: [
                              Text(
                                AppStrings.contactSupport,
                                style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontSize: Dimensions.height18,
                                    color:
                                        const Color(AppColors.MODERATE_BLUE)),
                              ),
                              const Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Color(AppColors.MODERATE_BLUE),
                              ),
                            ],
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
