import 'package:flutter/material.dart';
import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
class ListDetailComponent extends StatelessWidget {
  ListDetailComponent({Key? key,this.data}) : super(key: key);
  var data;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.width8),
      child: Container(
        width: Dimensions.screenWidth,
        height: Dimensions.height309,
        decoration: BoxDecoration(
          color: const Color(AppColors.WHITE),
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius19)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 12,
              blurRadius: 7,
              offset: const Offset(4, 6), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Dimensions.screenWidth*0.60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width34,right: Dimensions.width20,top: Dimensions.height16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.company,style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: Dimensions.height18,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: Dimensions.height3,),
                        Container(
                          height: Dimensions.height3,
                          width: Dimensions.width38,
                          color: const Color(AppColors.STRONG_BLUE),
                        ),
                        SizedBox(height: Dimensions.height6,),
                        Text(data.companyLocation,style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: Dimensions.height9,
                            color: const Color(AppColors.MODERATE_BLUE)
                        ),),
                        SizedBox(height: Dimensions.height8,),
                        Text("Report to",style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: Dimensions.height9,
                            color: Color(AppColors.MODERATE_BLUE)
                        ),),
                        SizedBox(height: Dimensions.height2,),
                        Text(data.reportTo,style: TextStyle(
                          fontFamily: "Helvetica",
                          fontSize: Dimensions.height13,

                        ),),
                        SizedBox(height: Dimensions.height10,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                    child: Container(
                      width: double.maxFinite,
                      height: Dimensions.height40,
                      decoration: BoxDecoration(
                          color:const Color(AppColors.VERY_PALE_MOSTLY_WHITE_BLUE),
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius19))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Wage: ",style: TextStyle(
                              fontSize: Dimensions.height9,
                              fontFamily: "Helvetica",
                              color: const Color(AppColors.MODERATE_BLUE)
                          ),),
                          Text("\$15-40/hr",style: TextStyle(
                              fontSize: Dimensions.height18,
                              fontFamily: "Helvetica",
                              color: const Color(AppColors.STRONG_BLUE),
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.width34,right: Dimensions.width20,top: Dimensions.height16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shift dates",style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: Dimensions.height9,
                            color: Color(AppColors.MODERATE_BLUE)
                        ),),
                        SizedBox(height: Dimensions.height2,),
                        Text("${data.startDate} - ${data.endDate}",style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: Dimensions.height13
                        ),),
                        SizedBox(height: Dimensions.height12,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Shift hours",style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontSize: Dimensions.height9,
                                    color: Color(AppColors.MODERATE_BLUE)
                                ),),
                                SizedBox(height: Dimensions.height2,),
                                Text("${data.startTime} - ",style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontSize: Dimensions.height13
                                ),),
                                SizedBox(height: Dimensions.height2,),
                                Text(data.endTime,style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontSize: Dimensions.height13
                                ),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Duration",style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontSize: Dimensions.height9,
                                    color: const Color(AppColors.MODERATE_BLUE)
                                ),),
                                SizedBox(height: Dimensions.height2,),
                                Text("8 Hours/Day",style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontSize: Dimensions.height13
                                ),),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: Dimensions.screenWidth*0.30,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius8),bottomRight: Radius.circular(Dimensions.radius8)),
                  image: DecorationImage(
                    image: NetworkImage(
                      "${ApiConstants.IMAGE_BASE}${data.path}${data.displayImage}",
                    ),
                    fit: BoxFit.cover,
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 13,right: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width:Dimensions.width40,
                      height: Dimensions.height40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(AppColors.WHITE)
                      ),
                      child: Icon(Icons.location_pin,color: Color(AppColors.STRONG_CYAN),size: Dimensions.height24,),
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ));
  }
}
