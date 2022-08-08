import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
class HomeAvailabilityJobEmpty extends StatelessWidget {
  const HomeAvailabilityJobEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/nojob.png"),
          SizedBox(height: Dimensions.height27,),
          Text("There are no items to display here.",style: TextStyle(
            fontFamily: "Helvetica",
            fontSize: Dimensions.height18,
            color: Color(AppColors.DARK_GRAYISH_BLUE2)
          ),)
        ],
      ),
    );
  }
}
