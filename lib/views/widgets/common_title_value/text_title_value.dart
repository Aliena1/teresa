import 'package:flutter/material.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/controllers/signup_controller/signup_controller.dart';
import 'package:teresa/helpers/validators/validators.dart';

import '../../../constants/colors/colors.dart';

class CommonTextTitleValue extends StatelessWidget {
  const CommonTextTitleValue(
      {Key? key,
        this.titleName,
        this.valueName,
        this.marginTop
      })
      : super(key: key);
  final String? titleName;
  final String? valueName;
  final double? marginTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: marginTop!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleName!,
            style: TextStyle(
                fontFamily: "Helvetica", fontSize: Dimensions.height12),
          ),
          SizedBox(height: Dimensions.height15),
          Text(
            valueName!,
                style: TextStyle(
                    fontFamily: "Helvetica", fontSize: Dimensions.height16,color: AppColors.subtitleBlack)),
          SizedBox(height: Dimensions.height5),
          const Divider(height: 2,color: AppColors.darkGray,),

        ],
      ),
    );
  }
}
