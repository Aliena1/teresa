import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/constants/icons/app_icons.dart';
import 'package:teresa/helpers/validators/validators.dart';
import 'package:teresa/views/pages/notification/notification.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
import 'package:teresa/views/widgets/common_textfield/common_textfield.dart';
import 'package:get/get.dart';

import '../../../helpers/helperFunction/helperFunctions.dart';
class Profile extends StatelessWidget {
   Profile({Key? key}) : super(key: key);
  final helperFunction = HelperFunction();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.height27,
                  left: Dimensions.width25,
                  right: Dimensions.width25),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Dimensions.width40,
                    height: Dimensions.height40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),

                  ),
                  Image.asset(
                    "assets/icon.png",
                    height: Dimensions.height58,
                  ),
                  Container(
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height22,
            ),
            Padding(
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
                          image: const DecorationImage(
                              image: AssetImage("assets/selma2.png"),
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
                            "Selma Gurung",
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
                            "+977-06177201",
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
                            "REGISTERED NURSE",
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
            ),
            SizedBox(
              height: 33,
            ),
            Container(
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextField(
                    name: "Email address",
                    hintText: "selmag@gmail.com",
                    topPoint: Dimensions.height18,
                    nullMessage: FormValidators.EMAIL_VALIDATION_TEXT,
                  ),
                  CommonTextField(
                    name: "Mobile no.",
                    hintText: "6771300921",
                    topPoint: Dimensions.height18,
                    nullMessage: FormValidators.MOBILE_NO_VALIDATION_TEXT,
                  ),
                  Column(
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
                      GestureDetector(
                        onTap: (){

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
                              Text("10/12/1994",
                                  style: TextStyle(
                                      fontFamily: "Helvetica",
                                      fontSize: Dimensions.height12,
                                      color: const Color(AppColors.DARK_GRAY)))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  CommonTextField(
                    name: "Birth location",
                    hintText: "Kathmandu, Nepal",
                    topPoint: Dimensions.height18,
                    nullMessage: FormValidators.MOBILE_NO_VALIDATION_TEXT,
                  ),
                  CommonTextField(
                    name: "Home phone number.",
                    hintText: "8120-031",
                    topPoint: Dimensions.height18,
                    nullMessage: FormValidators.MOBILE_NO_VALIDATION_TEXT,
                  ),
                  SizedBox(height: Dimensions.height53,),
                  CommonButton(
                    name: "Change password",
                    color: AppColors.STRONG_BLUE,
                    width: Dimensions.screenWidth,
                    height: Dimensions.height45,
                    fontSize: Dimensions.height15,
                    radius: Dimensions.radius8,
                    onPressed: (){},
                  ),
                  SizedBox(height: Dimensions.height25,),
                  CommonButton(
                    name: "Logout",
                    color: AppColors.STRONG_CYAN,
                    width: Dimensions.screenWidth,
                    height: Dimensions.height45,
                    fontSize: Dimensions.height15,
                    radius: Dimensions.radius8,
                    onPressed: (){
                     helperFunction.logout();

                    },
                  )
                ],
              ),
            ),
            SizedBox(height: Dimensions.height30,),
            Container(
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width34),
              child: Column(
                children: [
                  CommonTextField(
                    name: "First name",
                    hintText: "Surav Shah",
                    topPoint: Dimensions.height35,
                    nullMessage: FormValidators.FIRST_NAME_VALIDATION_TEXT,
                  ),
                  CommonTextField(
                    name: "Relationship",
                    hintText: "Husband",
                    topPoint: Dimensions.height35,
                    nullMessage: FormValidators.EMAIL_VALIDATION_TEXT,
                  ),
                  CommonTextField(
                    name: "Mobile no",
                    hintText: "67124209082",
                    topPoint: Dimensions.height35,
                    nullMessage: FormValidators.MOBILE_NO_VALIDATION_TEXT,
                  ),
                  CommonTextField(
                    name: "Home phone no.",
                    hintText: "8120-031",
                    topPoint: Dimensions.height35,
                    nullMessage: FormValidators.MOBILE_NO_VALIDATION_TEXT,
                  ),
                  CommonTextField(
                    name: "Email address",
                    hintText: "suravs@gmail.com",
                    topPoint: Dimensions.height35,
                    nullMessage: FormValidators.EMAIL_VALIDATION_TEXT,
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height30,),
            Container(
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
            ),

          ],
        ),
      ),
    ));
  }
}
