import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:teresa/constants/colors/colors.dart';
import '../../../constants/dimensions/dimensions.dart';

checkMailDialog(context,String message) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Container(
          width: Dimensions.width300,
          height: Dimensions.height300,
          padding: const EdgeInsets.only(top: 0),
          child: Dialog(
            elevation: Dimensions.height16,
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: Dimensions.height10,),
                      Text("Verification",style: TextStyle(
                          fontSize: Dimensions.height20,
                          fontWeight: FontWeight.w500
                      )),
                      Lottie.asset("assets/mail.json",width: Dimensions.width200),
                      SizedBox(height: Dimensions.height10,),
                      Text(message,style: TextStyle(
                          fontSize: Dimensions.height14,
                          fontWeight: FontWeight.w500
                      )),
                      SizedBox(height: Dimensions.height20,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width29),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            SizedBox(width: Dimensions.height5,),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Color(AppColors.FORM_COLORS_DARKBLUE)),
                                ),
                                onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text(
                              "Ok",style: GoogleFonts.poppins(
                                color: const Color(AppColors.FORM_COLORS_DARKBLUE)
                            ),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height10,)

                    ],
                  ),
                )
              ],
            ),
          )
      );
    },
  );
}