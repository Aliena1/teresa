import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';

class NavigationComponents extends StatelessWidget {
  NavigationComponents({Key? key,this.icon,this.name,this.selected,this.index,this.onPressed}) : super(key: key);
  int? selected;
  IconData? icon;
  String? name;
  int? index;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width8,vertical: Dimensions.height8),
        width: Dimensions.width78,
        height: Dimensions.height74,
        decoration: BoxDecoration(
          color: Color(index==selected?AppColors.STRONG_CYAN:AppColors.LIGHT_GRAYISH_BLUE3),
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius8)),
          boxShadow: [
            BoxShadow(
              color: const Color(AppColors.STRONG_CYAN).withOpacity(index==selected?0.2:0),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon,color: Color(index==selected?AppColors.WHITE:AppColors.VERY_DARK_GRAY),size: Dimensions.height22),
                SizedBox(height: Dimensions.height5,),
                Text(name!,textAlign: TextAlign.center,style: TextStyle(
                    color: Color(index==selected?AppColors.WHITE:AppColors.VERY_DARK_GRAY),
                    fontFamily: "Helvetica",
                    fontSize: Dimensions.height11

                ),)
              ],
            ),
            Positioned(
                top: 0,
                right: Dimensions.width8,
                child: index==1?Container(
                  width: Dimensions.width17,
                  height: Dimensions.height14,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius19))),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                          color: const Color(AppColors.WHITE),
                          fontSize: Dimensions.height9),
                    ),
                  ),
                ):Container())
          ],
        ),
      ),
    );
  }
}
