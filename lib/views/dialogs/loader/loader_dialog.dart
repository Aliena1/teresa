import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:teresa/constants/colors/colors.dart';

import '../../../constants/dimensions/dimensions.dart';
class Loading{
  showLoading([String message="loading..."]){
    Get.dialog(
      barrierColor: Colors.white.withOpacity(0.50),
      barrierDismissible: false,
      transitionDuration: Duration(seconds: 1),
      transitionCurve: Curves.fastLinearToSlowEaseIn,
      AlertDialog(
        elevation: 10,
        contentPadding: EdgeInsets.zero,
        content: Row(
          children: [
            Lottie.asset("assets/loader.json",height: Dimensions.height110),
            Text(message,style: TextStyle(
                fontSize: Dimensions.height14,
              fontWeight: FontWeight.w600,
                color: const Color(AppColors.FORM_COLORS_DARKBLUE)
              
            )),
          ],
        )
      ),
    );
  }

  void hideLoading(){
    if(Get.isDialogOpen!) Get.back();
  }
}