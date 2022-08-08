import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
ActiveJobEnableBreak(context) {
  showDialog(
    barrierColor: Color(AppColors.WHITE).withOpacity(0.5),
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: Dimensions.width25),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius19))),
        elevation: Dimensions.height16,
        child: Container(
          height: Dimensions.height221,
          padding: const EdgeInsets.only(top: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius19))
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width36,right: Dimensions.width36,top: Dimensions.height21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text("Break Enable",style: TextStyle(
                          fontSize: Dimensions.height25,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: Dimensions.height19,),
                      Text("Enable your unpaid break, the break lasts 30 minutes and when enabled, the break time is tracked by the system.",style: TextStyle(
                          fontSize: Dimensions.height13,
                      ),)
                    ]
                ),
              ),
              SizedBox(height: Dimensions.height33,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonButton(
                      name: "Cancel",
                      width: Dimensions.width140,
                      height: Dimensions.height45,
                      radius: Dimensions.radius8,
                      fontSize: Dimensions.height16,
                      color: AppColors.STRONG_CYAN,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    CommonButton(
                      name: "Enable",
                      width: Dimensions.width140,
                      height: Dimensions.height45,
                      radius: Dimensions.radius8,
                      fontSize: Dimensions.height16,
                      color: AppColors.STRONG_BLUE,
                      onPressed: (){
                        // Navigator.pop(context);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}