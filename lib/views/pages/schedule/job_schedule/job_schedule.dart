
import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
class JobSchedule extends StatelessWidget {
  const JobSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth,
      height: Dimensions.height150,
      decoration: BoxDecoration(
          color: Color(AppColors.LIGHT_GRAYISH_CYAN),
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius8))
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top:Dimensions.height25,left: Dimensions.width34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Twilight health",style: TextStyle(
                    fontSize: Dimensions.height20,
                    fontWeight: FontWeight.bold
                ),),
                Container(
                  width: Dimensions.width32,
                  height: Dimensions.height3,
                  color: Color(AppColors.STRONG_BLUE),
                ),
                SizedBox(height: Dimensions.height10,),
                Text("3:00 pm - 6:00 pm",style: TextStyle(fontSize: Dimensions.height13,color: Color(AppColors.STRONG_BLUE)),),
                SizedBox(height: Dimensions.height14,),
                Container(
                  width: Dimensions.width196,
                  height: Dimensions.height40,
                  decoration: BoxDecoration(
                      color: const Color(
                          AppColors.VERY_PALE_MOSTLY_WHITE_BLUE),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius19))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Wage: ",
                        style: TextStyle(
                            fontSize: Dimensions.height9,
                            fontFamily: "Helvetica",
                            color:
                            const Color(AppColors.MODERATE_BLUE)),
                      ),
                      Text(
                        "\$15-40/hr",
                        style: TextStyle(
                            fontSize: Dimensions.height18,
                            fontFamily: "Helvetica",
                            color: const Color(AppColors.STRONG_BLUE),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: Dimensions.width32,
              child: Container(
                width: Dimensions.width39,
                height: Dimensions.height66,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/hospital.png"),fit: BoxFit.cover),
                    color: const Color(AppColors.STRONG_BLUE),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimensions.radius8),bottomRight: Radius.circular(Dimensions.radius8))
                ),
              )),
        ],
      ),
    );
  }
}
