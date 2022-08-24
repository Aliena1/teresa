import 'package:flutter/material.dart';
import 'package:teresa/constants/app_assets/app_asset.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/constants/icons/app_icons.dart';
import 'package:teresa/helpers/validators/validators.dart';
import 'package:teresa/models/profile_view_model/profile_view_model.dart';
import 'package:teresa/views/pages/notification/notification.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
import 'package:teresa/views/widgets/common_textfield/common_textfield.dart';
import 'package:get/get.dart';

import '../../../constants/api_constants/api_constant.dart';
import '../../../controllers/profile_view_controller/profile_view_controller.dart';
import '../../../helpers/helperFunction/helperFunctions.dart';
import '../../widgets/common_title_value/text_title_value.dart';
class Profile extends GetView<ProfileViewController> {
   Profile({Key? key}) : super(key: key);
  final helperFunction = HelperFunction();


  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileViewController());

    return SafeArea(
        child: Scaffold(
      body: controller.obx(
        (data) => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.height27,
                    left: Dimensions.width25,
                    right: Dimensions.width25),

                child: Align(alignment: Alignment.topRight,child: buildNotification()),
              ),
              SizedBox(
                height: Dimensions.height22,
              ),
              buildAppbarContents(data),

              const SizedBox(
                height: 33,
              ),
              buildAccountDetailsBar(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextTitleValue(titleName: 'Email address',
                     valueName: data!.jobseekerUserProfile!.fullName!,
                      marginTop: Dimensions.height18,),
                    CommonTextTitleValue(titleName: 'Mobile Number',
                      valueName: data!.jobseekerUserProfile!.walletAmount!,
                      marginTop: Dimensions.height18,),

                    buildDateOfBirth(data!.jobseekerUserProfile!.walletAmount!),
                    CommonTextTitleValue(titleName: 'Birth location',
                      valueName: data!.jobseekerUserProfile!.walletAmount!,
                      marginTop: Dimensions.height18,),

                    CommonTextTitleValue(titleName: 'Home phone number',
                      valueName: data!.jobseekerUserProfile!.walletAmount!,
                      marginTop: Dimensions.height18,),

                    SizedBox(height: Dimensions.height53,),

                    buildChangePasswordButton(),

                    SizedBox(height: Dimensions.height25,),

                    buildLogoutButton()

                  ],
                ),
              ),

              SizedBox(height: Dimensions.height30,),

              buildEmergencyContactBar(),

              buildEmergencyContactField(
                  data!.jobseekerUserProfile!.fullName!,
                  data!.jobseekerUserProfile!.walletAmount!,
                  data!.jobseekerUserProfile!.walletAmount!,
                  data!.jobseekerUserProfile!.walletAmount!,
                  data!.jobseekerUserProfile!.walletAmount!
              ),

              SizedBox(height: Dimensions.height30,),

              buildAccessFullProfile(),

            ],
          ),
        ),
      ),
    ));
  }

  Container buildNotification() {
    return Container(
                    width: Dimensions.width50,
                    height: Dimensions.height50,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: IconButton(
                        alignment: Alignment.center,
                        splashRadius: Dimensions.height35,
                        constraints: BoxConstraints(),
                        onPressed: (){
                          Get.to(() =>
                              TeresaNotification());
                        }, icon: Stack(
                      children: [
                        Positioned(
                          bottom: Dimensions.height4,
                          right: Dimensions.width10,
                          child: Icon(Icons.notifications_none,
                            color: const Color(
                                AppColors.STRONG_BLUE),
                            size: Dimensions.height24,),),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: Dimensions.width17,
                              height: Dimensions.height17,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(
                                          Dimensions
                                              .radius100))),
                              child: Center(
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      color: const Color(
                                          AppColors.WHITE),
                                      fontSize:
                                      Dimensions.height9),
                                ),
                              ),))
                      ],
                    )),
                  );
  }

  Padding buildAppbarContents(ProfileViewModel? data) {
    return Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Dimensions.width110,
                        height: Dimensions.height129,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius8)),
                          image: DecorationImage(
                              image: NetworkImage("${ApiConstants.IMAGE_BASE}${data?.jobseekerUserProfile?.profileImage}"
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data!.jobseekerUserProfile!.fullName!,
                            style: TextStyle(
                                fontSize: Dimensions.height20,
                                color: const Color(AppColors.STRONG_BLUE),
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: Dimensions.height6,
                          ),
                          Text(
                            data!.jobseekerUserProfile!.walletAmount!,
                            style: TextStyle(
                                fontSize: Dimensions.height13,
                                color: Colors.black,
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: Dimensions.height6,
                          ),
                          Text(
                            data!.jobseekerUserProfile!.profession!,
                            style: TextStyle(
                              fontSize: Dimensions.height15,
                              color: const Color(AppColors.STRONG_CYAN),
                              fontFamily: "Helvetica",
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height17,
                  ),
                ],
              ),
            );
  }

  Container buildAccountDetailsBar() {
    return Container(
              width: Dimensions.screenWidth,
              height: Dimensions.height54,
              color: Color(AppColors.VERY_PALE_MOSTLY_WHITE_BLUE),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width46),
                    child: Text("Account Details",style: TextStyle(
                        fontSize: Dimensions.height18,
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),
            );
  }

  Container buildAccessFullProfile() {
    return Container(
              width: Dimensions.screenWidth,
              height: Dimensions.height154,
              color: const Color(AppColors.VERY_PALE_MOSTLY_WHITE_BLUE),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width34),
                    child: Text("Access your full profile",style: TextStyle(
                        fontSize: Dimensions.height18,
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: Dimensions.height16,),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width25,right: Dimensions.width25),
                    child: CommonButton(
                      height: Dimensions.height45,
                      fontSize: Dimensions.height15,
                      width: Dimensions.screenWidth,
                      radius: Dimensions.radius8,
                      color: AppColors.STRONG_BLUE,
                      name: "View full profile",
                      onPressed: (){},
                    ),
                  )
                ],
              ),
            );
  }

  Padding buildEmergencyContactField(String fullName,String relationship,String mobileNo,
      String homePhoneNo,String emailNo) {
    return Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width34),
              child: Column(
                children: [
                  CommonTextTitleValue(titleName: 'First Name',
                    valueName: fullName,
                    marginTop: Dimensions.height18,),

                  CommonTextTitleValue(titleName: 'Email address',
                    valueName: relationship,
                    marginTop: Dimensions.height18,),
                  CommonTextTitleValue(titleName: 'Email address',
                    valueName: mobileNo,
                    marginTop: Dimensions.height18,),
                  CommonTextTitleValue(titleName: 'Email address',
                    valueName: homePhoneNo,
                    marginTop: Dimensions.height18,),
                  CommonTextTitleValue(titleName: 'Email address',
                    valueName: emailNo,
                    marginTop: Dimensions.height18,),

                ],
              ),
            );
  }

  Container buildEmergencyContactBar() {
    return Container(
              width: Dimensions.screenWidth,
              height: Dimensions.height54,
              color: Color(AppColors.VERY_PALE_MOSTLY_WHITE_BLUE),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width46),
                    child: Text("Emergency contact",style: TextStyle(
                        fontSize: Dimensions.height18,
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),
            );
  }

  CommonButton buildLogoutButton() {
    return CommonButton(
                    name: "Logout",
                    color: AppColors.STRONG_CYAN,
                    width: Dimensions.screenWidth,
                    height: Dimensions.height45,
                    fontSize: Dimensions.height15,
                    radius: Dimensions.radius8,
                    onPressed: (){
                     helperFunction.logout();

                    },
                  );
  }

  CommonButton buildChangePasswordButton() {
    return CommonButton(
                    name: "Change password",
                    color: AppColors.STRONG_BLUE,
                    width: Dimensions.screenWidth,
                    height: Dimensions.height45,
                    fontSize: Dimensions.height15,
                    radius: Dimensions.radius8,
                    onPressed: (){
                      Get.toNamed('/changePassword');
                    },
                  );
  }

  Column buildDateOfBirth(String dateOfBirth) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimensions.height18,
                      ),
                      Text("Date of birth",style: TextStyle(
                          fontFamily: "Helvetica",
                          fontSize: Dimensions.height12
                      ),),
                      SizedBox(
                        height: Dimensions.height9,
                      ),
                      Container(
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
                              Offset(0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_month_outlined,
                                size: Dimensions.height14,
                                color: Color(AppColors.DARK_GRAY)),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            Text(dateOfBirth,
                                style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontSize: Dimensions.height12,
                                    color: const Color(AppColors.DARK_GRAY)))
                          ],
                        ),
                      )
                    ],
                  );
  }
}
