import 'package:flutter/material.dart';
import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/controllers/available_job_controller/decline_available_job_controller.dart';
import 'package:teresa/controllers/available_job_detail_controller/available_job_detail_controller.dart';
import 'package:teresa/views/pages/available_job/available_job_detail/available_job_detail.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
import 'package:get/get.dart';

import '../../../../dialogs/available_job_decline/available_job_decline.dart';
class AvailableListDetailComponent extends StatelessWidget {
  AvailableListDetailComponent({Key? key,this.declinePressed,this.data}) : super(key: key);
  final declinePressed;
  final availableJobDetailController=AvailableJobDetailController();
  final declineJobController = DeclineAvailableJobController();
  var data;
  @override
  Widget build(BuildContext context) {
    var duration = (data.totalDuration);
    // double num1 = double.parse((12.3412).toStringAsFixed(2));
    var doubleRoundUp = duration.ceil();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width8),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.all(Radius.circular(Dimensions.radius19)),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(2, 7), // changes position of shadow
          ),
        ],
      ),
      height: Dimensions.height380,
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: Dimensions.height370,
            decoration: BoxDecoration(
              color: const Color(AppColors.WHITE),
              borderRadius:
                  BorderRadius.all(Radius.circular(Dimensions.radius19)),

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Dimensions.screenWidth * 0.60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.height9,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width9),
                        child: Container(
                          width: double.maxFinite,
                          height: Dimensions.height40,
                          decoration: BoxDecoration(
                              color: const Color(
                                  AppColors.VERY_PALE_MOSTLY_WHITE_BLUE),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Dimensions.radius19))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "\$50",
                                style: TextStyle(
                                    fontSize: Dimensions.height18,
                                    fontFamily: "Helvetica",
                                    color: const Color(AppColors.STRONG_BLUE),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Additional pay if accepted now",
                                style: TextStyle(
                                    fontSize: Dimensions.height9,
                                    fontFamily: "Helvetica",
                                    color:
                                    const Color(AppColors.MODERATE_BLUE)),

                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width34,
                            right: Dimensions.width20,
                            top: Dimensions.height16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              data.company,
                              style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontSize: Dimensions.height18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: Dimensions.height3,
                            ),
                            Container(
                              height: Dimensions.height3,
                              width: Dimensions.width38,
                              color: const Color(AppColors.STRONG_BLUE),
                            ),
                            SizedBox(
                              height: Dimensions.height6,
                            ),
                            Text(
                              data.companyLocation,
                              style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontSize: Dimensions.height9,
                                  color: const Color(AppColors.MODERATE_BLUE)),
                            ),
                            SizedBox(
                              height: Dimensions.height8,
                            ),
                            Text(
                              "Position required",
                              style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontSize: Dimensions.height9,
                                  color: Color(AppColors.MODERATE_BLUE)),
                            ),
                            SizedBox(
                              height: Dimensions.height2,
                            ),
                            Text(
                              data.profession,
                              style: TextStyle(
                                fontFamily: "Helvetica",
                                fontSize: Dimensions.height13,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height5,
                            ),
                            Text(
                              "Report to",
                              style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontSize: Dimensions.height9,
                                  color: Color(AppColors.MODERATE_BLUE)),
                            ),
                            SizedBox(
                              height: Dimensions.height2,
                            ),
                            Text(
                              data.reportTo,
                              style: TextStyle(
                                fontFamily: "Helvetica",
                                fontSize: Dimensions.height13,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width20),
                        child: Container(
                          width: double.maxFinite,
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
                                "\$${data.companyRateForJobseeker}",
                                style: TextStyle(
                                    fontSize: Dimensions.height18,
                                    fontFamily: "Helvetica",
                                    color: const Color(AppColors.STRONG_BLUE),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width34,
                            right: Dimensions.width20,
                            top: Dimensions.height16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shift dates",
                              style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontSize: Dimensions.height9,
                                  color: Color(AppColors.MODERATE_BLUE)),
                            ),
                            SizedBox(
                              height: Dimensions.height2,
                            ),
                            Text(
                              "${data.startDate} - ${data.endDate}",
                              style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontSize: Dimensions.height13),
                            ),
                            SizedBox(
                              height: Dimensions.height12,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Shift hours",
                                      style: TextStyle(
                                          fontFamily: "Helvetica",
                                          fontSize: Dimensions.height9,
                                          color:
                                              Color(AppColors.MODERATE_BLUE)),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height2,
                                    ),
                                    Text(
                                      "${data.startTime} - ",
                                      style: TextStyle(
                                          fontFamily: "Helvetica",
                                          fontSize: Dimensions.height13),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height2,
                                    ),
                                    Text(
                                      "${data.endTime}",
                                      style: TextStyle(
                                          fontFamily: "Helvetica",
                                          fontSize: Dimensions.height13),
                                    )
                                  ],
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Duration",
                                        style: TextStyle(
                                            fontFamily: "Helvetica",
                                            fontSize: Dimensions.height9,
                                            color: const Color(
                                                AppColors.MODERATE_BLUE)),
                                      ),
                                      SizedBox(
                                        height: Dimensions.height2,
                                      ),
                                      Text(
                                        "$doubleRoundUp Hours/Day",
                                        style: TextStyle(
                                            fontFamily: "Helvetica",
                                            fontSize: Dimensions.height13),
                                      ),
                                    ],
                                  ),
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
                  width: Dimensions.screenWidth * 0.30,
                  height: Dimensions.height307,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius8),
                          bottomRight: Radius.circular(Dimensions.radius19),
                          bottomLeft: Radius.circular(Dimensions.radius19)),
                      image: DecorationImage(
                        image: NetworkImage(
                          "${ApiConstants.IMAGE_BASE}${data.path}${data.displayImage}",
                        ),
                        fit: BoxFit.cover,
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(top: Dimensions.height13, right: Dimensions.width9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: Dimensions.width40,
                          height: Dimensions.height40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(AppColors.WHITE)),
                          child: Icon(
                            Icons.location_pin,
                            color: Color(AppColors.STRONG_CYAN),
                            size: Dimensions.height24,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: Dimensions.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    GestureDetector(
                  onTap: (){
                    availableJobDeclineDialog(context,data.jobId.toString());

                  },
                  child: Text(
                    "Decline",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: Dimensions.height13,
                        fontFamily: "Helvetica",
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: Dimensions.width15,
                ),
                CommonButton(
                  width: Dimensions.width93,
                  height: Dimensions.height52,
                  onPressed: (){
                    availableJobDetailController.jobId=data.jobId.toString();
                    availableJobDetailController.getJobDetail();
                    Get.to(()=>AvailableJobDetail(
                      data:data
                    ));
                  },
                  color: AppColors.STRONG_CYAN,
                  name: "Details",
                  radius: Dimensions.radius8,
                  fontSize: Dimensions.height13,
                ),
                SizedBox(
                  width: Dimensions.width7,
                ),
                CommonButton(
                  width: Dimensions.width93,
                  height: Dimensions.height52,
                  onPressed: () {

                  },
                  color: AppColors.STRONG_BLUE,
                  name: "Accept",
                  radius: Dimensions.radius8,
                  fontSize: Dimensions.height13,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
