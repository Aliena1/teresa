import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/repository/available_job_detail_repository/decline_available_job_repository.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';

import '../../../controllers/available_job_controller/decline_available_job_controller.dart';
import '../loader/loader_dialog.dart';

  availableJobDeclineDialog(context, String stringJobId) {
    // Get.lazyPut(() => DeclineAvailableJobController());
    final declineAvailableJobRepo = DeclineAvailableJobRepo();
    DeclineAvailableJobController controller = Get.put(DeclineAvailableJobController());
    final declineAvailableJobController = DeclineAvailableJobController();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: Dimensions.width25),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(Dimensions.radius19))),
          elevation: Dimensions.height16,
          child: Container(
            height: Dimensions.height393,
            padding: const EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.radius19))
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.width36, right: Dimensions.width36),
                  child: Column(
                      children: [
                        SizedBox(height: Dimensions.height44,),
                        Image.asset("assets/close.png",),
                        SizedBox(height: Dimensions.height50,),
                        Text("Are you sure you want to decline the job?",
                          style: TextStyle(
                              fontSize: Dimensions.height20,
                              fontWeight: FontWeight.bold,
                              color: Color(AppColors.VIVID_RED)
                          ),),
                        SizedBox(height: Dimensions.height13),
                        Text(
                          "Job once declined will still be available in the available jobs till it is accepted by another jobseeker.",
                          style: TextStyle(
                              fontSize: Dimensions.height18
                          ),),
                        SizedBox(height: Dimensions.height33,),
                      ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonButton(
                        name: "Cancel",
                        width: Dimensions.width140,
                        height: Dimensions.height45,
                        radius: Dimensions.radius8,
                        fontSize: Dimensions.height16,
                        color: AppColors.STRONG_CYAN,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),

                     CommonButton(
                        name: "Decline",
                        width: Dimensions.width140,
                        height: Dimensions.height45,
                        radius: Dimensions.radius8,
                        fontSize: Dimensions.height16,
                        color: AppColors.STRONG_BLUE,
                        onPressed: () {
                          declineAvailableJobController.declineAvailableJob(
                              stringJobId);
                          // Get.back();
                        },
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
