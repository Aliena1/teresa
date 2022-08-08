import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teresa/constants/app_assets/app_asset.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/constants/icons/app_icons.dart';
class LoginSignupComponent extends StatelessWidget {
  const LoginSignupComponent({Key? key,this.type="register"}) : super(key: key);
  final  String? type;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: Dimensions.height283,
      color: const Color(AppColors.LIGHT_GRAYISH_BLUE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: Dimensions.height35,left: Dimensions.width25,right: Dimensions.width25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                type=="login"?Container(
            width: Dimensions.width40,
              height: Dimensions.height40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
            ):Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: Colors.blue.withOpacity(0.4),
                    splashColor: Colors.green.withOpacity(0.5),
                    onTap: (){
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
                            color: const Color(AppColors.GRAYISH_BLUE).withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(1, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: RotatedBox(
                          quarterTurns: 2,
                          child: Icon(AppIcons.PLAY_ARROW,color: const Color(AppColors.STRONG_BLUE),size: Dimensions.height24,)),
                    ),
                  ),
                ),
                Image.asset(AppAssets.appIcon,height: Dimensions.height58,fit: BoxFit.fitHeight,),
                Container(
                  width: Dimensions.width40,
                  height: Dimensions.height40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: Dimensions.height8,),
          Center(child: Image.asset(AppAssets.loginSticker,height: Dimensions.height181,width: Dimensions.screenWidth,))
        ],
      ),
    );
  }
}
