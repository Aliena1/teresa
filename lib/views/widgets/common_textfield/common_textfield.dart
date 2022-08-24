import 'package:flutter/material.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/controllers/signup_controller/signup_controller.dart';
import 'package:teresa/helpers/validators/validators.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField(
      {Key? key,
      this.name,
        this.initialValue,
      this.hintText,
      this.topPoint,
      this.controller,
      this.nullMessage,
      this.validationType = 0})
      : super(key: key);
  String? name;
  String? initialValue;
  String? hintText;
  double? topPoint;
  TextEditingController? controller;
  String? nullMessage;
  int? validationType;
  final sign = SignUpController();
  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: Dimensions.height3),
          TextFormField(
            scrollPadding: const EdgeInsets.only(bottom: 285),
            key: sign.formKey,
            validator: (value) {
              return validationType == 0
                  ? FormValidators.validateFormField(value, nullMessage)
                  : validationType == 1
                      ? FormValidators.validateEmailFormField(
                          value, nullMessage)
                      : FormValidators.validateMobileFormField(
                          value, nullMessage);
            },
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                    fontFamily: "Helvetica", fontSize: Dimensions.height16)),
          )
        ],
      ),
    );
  }
}
