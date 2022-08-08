import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/controllers/active_job_controller/active_job_controller.dart';
import 'package:teresa/controllers/active_job_detail_controller/active_job_detail_controller.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
AvailableTime(context) {
  final activeJobDetailController=ActiveJobDetailController();
  showDialog(
    barrierColor: Color(AppColors.WHITE).withOpacity(0.5),
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: Dimensions.width25),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius19))),
        elevation: Dimensions.height16,
        child: Container(
          width: Dimensions.screenWidth,
          height: Dimensions.height408,
          padding: const EdgeInsets.only(top: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius19))
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: Dimensions.width21,right: Dimensions.width21,top: Dimensions.height21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Available time",style: TextStyle(
                      fontSize: Dimensions.height25,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: Dimensions.height40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Set Date",
                        style: TextStyle(
                            fontSize: Dimensions.height11,
                            fontFamily: "Helvetica",

                        ),),
                      SizedBox(height: Dimensions.height5,),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          height: Dimensions.height31,
                          width: Dimensions.width141,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.radius19)),
                            color: const Color(AppColors.WHITE),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                Offset(0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_month_outlined,
                                  size: Dimensions.height11,
                                  color: const Color(AppColors.DARK_GRAY)),
                              SizedBox(
                                width: Dimensions.width5,
                              ),
                              Text("select a date",
                                  style: TextStyle(
                                      fontFamily: "Helvetica",
                                      fontSize: Dimensions.height12,
                                      color: const Color(AppColors.DARK_GRAY))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.height27,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Time available in",
                        style: TextStyle(
                            fontSize: Dimensions.height11,
                            fontFamily: "Helvetica",

                        ),),
                      SizedBox(height: Dimensions.height5,),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          height: Dimensions.height31,
                          width: Dimensions.width141,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.radius19)),
                            color: const Color(AppColors.WHITE),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                Offset(0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.calendar_month_outlined,
                                      size: Dimensions.height11,
                                      color: const Color(AppColors.DARK_GRAY)),
                                  SizedBox(
                                    width: Dimensions.width5,
                                  ),
                                  Text("start",
                                      style: TextStyle(
                                          fontFamily: "Helvetica",
                                          fontSize: Dimensions.height12,
                                          color: const Color(AppColors.DARK_GRAY))),
                                ],
                              ),
                              SizedBox(width: Dimensions.width7,),
                              Container(
                                width: 1,
                                height: Dimensions.height17,
                                color: const Color(AppColors.STRONG_CYAN),
                              ),
                              SizedBox(width: Dimensions.width7,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.calendar_month_outlined,
                                      size: Dimensions.height11,
                                      color: const Color(AppColors.DARK_GRAY)),
                                  SizedBox(
                                    width: Dimensions.width5,
                                  ),
                                  Text("end",
                                      style: TextStyle(
                                          fontFamily: "Helvetica",
                                          fontSize: Dimensions.height12,
                                          color: const Color(AppColors.DARK_GRAY)))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.height33),
                  Row(
                    children: [
                      Container(
                        width: Dimensions.width66,
                        height: Dimensions.height24,
                        decoration: BoxDecoration(
                          color: Color(AppColors.STRONG_BLUE),
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius19))
                        ),
                        child: Center(
                          child: Text("Exact time",
                            style: TextStyle(
                            fontSize: Dimensions.height11,
                            color: Color(AppColors.WHITE)
                          ),
                          ),
                        ),
                      ),
                      SizedBox(width: Dimensions.height14),
                      Container(
                        width: Dimensions.width66,
                        height: Dimensions.height24,
                        decoration: BoxDecoration(
                            color: Color(AppColors.WHITE),
                            border: Border.all(color: Color(AppColors.STRONG_BLUE)),
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
                                  color: Color(AppColors.STRONG_BLUE)
                              ),
                            ),
                            Icon(Icons.arrow_drop_down,size: Dimensions.height20)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.height30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonButton(
                        name: "Cancel",
                        width: Dimensions.width139,
                        height: Dimensions.height45,
                        color: AppColors.STRONG_CYAN,
                        fontSize: Dimensions.height18,
                        radius: Dimensions.radius8,
                        onPressed: (){

                        },
                      ),
                      CommonButton(
                        name: "Submit",
                        width: Dimensions.width139,
                        height: Dimensions.height45,
                        color: AppColors.STRONG_BLUE,
                        fontSize: Dimensions.height18,
                        radius: Dimensions.radius8,
                        onPressed: (){

                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}