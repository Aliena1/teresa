import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
class NotificationList extends StatelessWidget {
  NotificationList({Key? key,this.image,this.text1,this.boldText,this.text3,this.type="success"}) : super(key: key);
  String? image;
  String? text1;
  String? boldText;
  String? text3;
  String? type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth,
      color: Color(type=="cancel"?AppColors.WHITE:AppColors.VERY_PALE_MOSTLY_WHITE_BLUE),
      child: Padding(
        padding: EdgeInsets.only(top:Dimensions.height14,bottom:Dimensions.height14,left: Dimensions.width36,right: Dimensions.width23),
        child: Row(
          children: [
            Container(
              width: Dimensions.width50,
              height: Dimensions.height50,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image!),
                fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius8))
              ),
            ),
            SizedBox(width: Dimensions.width10,),
            Container(
              width: Dimensions.screenWidth*0.45,
              child: RichText(
                text: TextSpan(
                  text: '$text1 ',
                  style:TextStyle(fontSize: Dimensions.height9,
                    color: Colors.black
                  ),
                  children: <TextSpan>[
                    TextSpan(text: '$boldText', style: TextStyle(fontSize: Dimensions.height9,color: Colors.black,fontWeight: FontWeight.bold)),
                    TextSpan(text: ' $text3', style: TextStyle(fontSize: Dimensions.height9,color: Colors.black)),
                  ],
                ),
              )
            ),
            SizedBox(width: Dimensions.width10),
            Visibility(
                visible: type=="cancel"?false:true,
                child: CommonButton(
              width: Dimensions.width66,
              height: Dimensions.height23,
              color: AppColors.STRONG_BLUE,
              radius: Dimensions.radius8,
              fontSize: Dimensions.height9,
              name: "Show",
              onPressed: (){},
            ))
          ],
        ),
      ),
    );
  }
}
