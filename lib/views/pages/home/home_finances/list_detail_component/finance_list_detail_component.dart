import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/controllers/finance_list_controller/finance_list_controller.dart';

class FinanceListDetailComponent extends StatelessWidget {
  FinanceListDetailComponent({Key? key,this.data}) : super(key: key);
  var data;
  final financeListController=Get.put(FinanceListController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenWidth,
      height: Dimensions.height110,
      child: Stack(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.width18),child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Dimensions.width63,
                height: Dimensions.height86,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/hospital.png")),
                    borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius8))),
              ),
              SizedBox(
                width: Dimensions.width15,
              ),
              Container(
                padding: EdgeInsets.only(top: Dimensions.height10),
                width: Dimensions.screenWidth*0.70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.company,
                              style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.height13),
                            ),
                            SizedBox(
                              height: Dimensions.height4,
                            ),
                            Container(
                              width: Dimensions.width38,
                              height: Dimensions.height3,
                              color: const Color(AppColors.STRONG_BLUE),
                            ),
                            SizedBox(
                              height: Dimensions.height4,
                            ),
                            Text(
                              data.companyLocation,
                              style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontSize: Dimensions.height9,
                                  color: const Color(AppColors.MODERATE_BLUE)),
                            )
                          ],
                        ),
                        Container(
                          height: Dimensions.height40,
                          padding: EdgeInsets.symmetric(vertical: Dimensions.height4,horizontal: Dimensions.width7),
                          decoration: BoxDecoration(
                              color: const Color(AppColors.VERY_PALE_MOSTLY_WHITE_BLUE),
                              borderRadius:
                              BorderRadius.all(Radius.circular(Dimensions.radius19))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Wage:",
                                style: TextStyle(
                                    color: const Color(AppColors.MODERATE_BLUE),
                                    fontSize: Dimensions.height9,
                                    fontFamily: "Helvetica"),
                              ),
                              Text(
                                "\$${data.amount}",
                                style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontSize: Dimensions.height18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(AppColors.MODERATE_BLUE)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: Dimensions.height12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Dimensions.screenWidth*0.20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Shift hours",style: TextStyle(
                                  fontSize: Dimensions.height9,
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.bold
                              ),),
                              Text("${data.shiftHour} hours",style: TextStyle(
                                fontSize: Dimensions.height9,
                                fontFamily: "Helvetica",
                              ),)
                            ],
                          ),
                        ),
                        Container(
                          width: Dimensions.screenWidth*0.20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Break hours",style: TextStyle(
                                  fontSize: Dimensions.height9,
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.bold
                              ),),
                              Text("${financeListController.getBreakTime(data.breakHour)} minutes",style: TextStyle(
                                fontSize: Dimensions.height9,
                                fontFamily: "Helvetica",
                              ),)
                            ],
                          ),
                        ),
                        Container(
                          width: Dimensions.screenWidth*0.20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total hours",style: TextStyle(
                                  fontSize: Dimensions.height9,
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.bold
                              ),),
                              Text(financeListController.getTotalHours(data.totalHours),style: TextStyle(
                                fontSize: Dimensions.height9,
                                fontFamily: "Helvetica",
                              ),),

                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
          Positioned(
              bottom: 0,
              child: Container(
            width: Dimensions.screenWidth,
            height: Dimensions.height48,
            decoration: BoxDecoration(
                color: const Color(AppColors.WHITE),
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffF1F1F1).withOpacity(0.0),
                    Color(0xffE5E5E5).withOpacity(0.4),
                  ],
                )
            ),
          ))
        ],
      ),
    );
  }
}
