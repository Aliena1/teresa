import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/constants/icons/app_icons.dart';
import 'package:teresa/helpers/helperFunction/helperFunctions.dart';
import 'package:teresa/helpers/validators/validators.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField(
      {Key? key,
      this.name,
      this.hintText,
      this.topPoint,
      this.controller,
      this.nullMessage,
      this.lengthMessage,
      this.obscure = false,
       })
      : super(key: key);

  final helperFunction = HelperFunction();
  final obscure;
  final String? name;
  final String? hintText;
  final double? topPoint;
  final TextEditingController? controller;
  final String? nullMessage;
  final String? lengthMessage;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(top: topPoint!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name!,
              style: TextStyle(
                  fontFamily: "Helvetica", fontSize: Dimensions.height12),
            ),
            SizedBox(height: Dimensions.height5),
            TextFormField(
              scrollPadding: const EdgeInsets.only(bottom: 285),
              validator: (value) {
                return FormValidators.validatePassword(
                    value, nullMessage, lengthMessage);
              },
              controller: controller,
              obscureText: obscure.value,
              decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: name == "Password"?
                    Container(
                      width: Dimensions.width40,
                      height: Dimensions.height40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(AppColors.LIGHT_GRAYISH_BLUE2)),
                      child:
                      IconButton(
                          onPressed: () {
                            helperFunction.showHidePassword(obscure);
                          },
                          icon: obscure.value == false?Icon(
                            Icons.visibility,
                            color: const Color(AppColors.DARK_GRAYISH_BLUE),
                            size: Dimensions.height24,
                          ):Icon(Icons.visibility_off,color: const Color(AppColors.DARK_GRAYISH_BLUE),
                            size: Dimensions.height24,)
                      ),
                    ): null
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(
                      fontFamily: "Helvetica", fontSize: Dimensions.height16)),
            )
          ],
        ),
      );
      });
  }
}
