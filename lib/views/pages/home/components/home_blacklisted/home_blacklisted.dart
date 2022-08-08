import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
class HomeBlackListed extends StatelessWidget {
  const HomeBlackListed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth,
      height: Dimensions.height236,
      padding: EdgeInsets.only(left: Dimensions.width23,right: Dimensions.width23,top: Dimensions.height13),
      color: Color(AppColors.LIGHT_GRAYISH_BLUE3),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: Dimensions.height8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Dimensions.width46,
                  height: Dimensions.height46,
                  decoration: const BoxDecoration(
                      color: Color(AppColors.WHITE),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/blacklisted.png",),
                        fit: BoxFit.none

                      )
                  ),
                ),
                SizedBox(width: Dimensions.width16,),
                Container(
                  width: Dimensions.screenWidth*0.65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your Profile has been blacklisted",style: TextStyle(
                          fontFamily: "Helvetica",
                          fontSize: Dimensions.height20,
                          fontWeight: FontWeight.bold,
                          color: Color(AppColors.VIVID_RED)
                      ),),
                      SizedBox(height: Dimensions.height12,),
                      Text("Blacklisted accounts cannot accept any available jobs, please contact Teresa to waver this status.",
                        style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: Dimensions.height18

                        ),),
                      SizedBox(height: Dimensions.height36),
                      Center(
                        child: CommonButton(
                          height: Dimensions.height39,
                          width: Dimensions.width139,
                          color: AppColors.VIVID_RED,
                          name: "Show remark",
                          radius: Dimensions.radius8,
                          fontSize: Dimensions.height16,
                          onPressed: (){},
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
          Positioned(
            width: Dimensions.screenWidth,
              left: Dimensions.width140,
              child: Container(
            width: Dimensions.width22,
            height: Dimensions.height22,
            decoration: const BoxDecoration(
                color: Color(AppColors.WHITE),
                shape: BoxShape.circle
            ),
            child: Center(
              child: Transform.rotate(angle: pi/4,child: Icon(Icons.add,size: Dimensions.height24,)),
            ),
          ))
        ],
      ),
    );

  }
}
