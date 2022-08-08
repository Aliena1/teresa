import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
class SettingMenu extends StatelessWidget {
  const SettingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Dimensions.width26,right: Dimensions.width26,top: Dimensions.height22),
      width: Dimensions.screenWidth,
      height: Dimensions.height174,
      decoration: BoxDecoration(
        border: Border.all(color: Color(AppColors.STRONG_BLUE)),
        color: const Color(AppColors.STRONG_BLUE),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: Dimensions.screenWidth*0.70,
                child: Text("Display jobs according to my available time",style: TextStyle(
                    fontSize: Dimensions.height18,
                    fontWeight: FontWeight.bold,
                    color: const Color(AppColors.WHITE)
                ),),
              ),
              Switch(value: false, onChanged: (value){})
            ],
          ),
          Row(
            children: [
              Icon(Icons.info,color: const Color(AppColors.WHITE),size: Dimensions.height24),
              SizedBox(width: Dimensions.height6,),
              Text("When disabled the application shows you all available job",style: TextStyle(
                color: const Color(AppColors.WHITE),
                fontSize: Dimensions.height9
              ),),

            ],
          ),
          SizedBox(height: Dimensions.height16,),
          CommonButton(
            width: Dimensions.width140,
            height: Dimensions.height40,
            color: AppColors.STRONG_CYAN,
            fontSize: Dimensions.height13,
            radius: Dimensions.radius8,
            name: "Change Settings",
            onPressed: (){},
          )
        ],
      ),
    );
  }
}
