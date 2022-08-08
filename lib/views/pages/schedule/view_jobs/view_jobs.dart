import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
class ViewJobs extends StatelessWidget {
  const ViewJobs({Key? key,this.onPressed}) : super(key: key);
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth,
      height: Dimensions.height150,
      decoration: BoxDecoration(
        color: const Color(AppColors.LIGHT_GRAYISH_CYAN),
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius8))
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top:Dimensions.height25,left: Dimensions.width34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Available time",style: TextStyle(
                  fontSize: Dimensions.height20,
                  fontWeight: FontWeight.bold
                ),),
                Container(
                  width: Dimensions.width32,
                  height: Dimensions.height3,
                  color: const Color(AppColors.STRONG_BLUE),
                ),
                SizedBox(height: Dimensions.height10,),
                Text("2:00 pm - 3:00 pm",style: TextStyle(fontSize: Dimensions.height13,color: const Color(AppColors.STRONG_BLUE)),),
                SizedBox(height: Dimensions.height14,),
                Row(
                  children: [
                    Container(
                      height: Dimensions.height24,
                      width: Dimensions.width66,
                      decoration: BoxDecoration(
                          color: const Color(AppColors.STRONG_BLUE),
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius19))
                      ),
                      child: Center(
                        child: Text("Exact time",style: TextStyle(
                          color: const Color(AppColors.WHITE),
                          fontSize: Dimensions.height11,

                        )),
                      ),
                    ),
                    SizedBox(width: Dimensions.width14,),
                    Container(
                      width: Dimensions.width66,
                      height: Dimensions.height24,
                      decoration: BoxDecoration(
                          color: const Color(AppColors.WHITE),
                          border: Border.all(color: const Color(AppColors.STRONG_BLUE)),
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius19))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.add,size: Dimensions.height10),
                              Icon(Icons.remove,size: Dimensions.height10)
                            ],
                          ),
                          Text("1 hrs",
                            style: TextStyle(
                                fontSize: Dimensions.height11,
                                color: const Color(AppColors.STRONG_BLUE)
                            ),
                          ),
                          Icon(Icons.arrow_drop_down,size: Dimensions.height20)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
              right: Dimensions.width32,
              child: GestureDetector(
                onTap: onPressed,
                child: Container(
                  width: Dimensions.width39,
                  height: Dimensions.height66,
                  decoration: BoxDecoration(
                      color: const Color(AppColors.STRONG_BLUE),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimensions.radius8),bottomRight: Radius.circular(Dimensions.radius8))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month,color: const Color(AppColors.WHITE),size: Dimensions.height16,),
                      SizedBox(height: Dimensions.height4,),
                      Text("View jobs",textAlign: TextAlign.center,style: TextStyle(
                          fontSize: Dimensions.height13,
                          color: Color(AppColors.WHITE)
                      ),)
                    ],
                  ),
                ),
              )),
          Positioned(
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(right: Dimensions.width20,bottom: Dimensions.height11),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: Dimensions.height29,
                    width: Dimensions.height29,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(AppColors.STRONG_BLUE)
                    ),
                    child: Icon(Icons.edit,size: Dimensions.height16,color: const Color(AppColors.WHITE)),
                  ),
                  SizedBox(width: Dimensions.width11,),
                  Container(
                    height: Dimensions.height29,
                    width: Dimensions.height29,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(AppColors.VIVID_RED)
                    ),
                    child: Icon(Icons.delete_outline,size: Dimensions.height16,color: const Color(AppColors.WHITE)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
