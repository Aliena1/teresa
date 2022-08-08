import 'package:flutter/material.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
class CommonButton extends StatelessWidget {
  CommonButton({Key? key,this.name,this.width,this.height,this.color,this.radius,this.onPressed,this.fontSize}) : super(key: key);
  String? name;
  double? width;
  double? height;
  int? color;
  double? radius;
  final onPressed;
  double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(color!),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!))
        ),
        onPressed: onPressed,
        child: Text(name!,textAlign: TextAlign.center,style: TextStyle(
          fontFamily: "Helvetica",
              fontSize: fontSize,
              fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
