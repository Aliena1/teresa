import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/controllers/active_job_controller/active_job_controller.dart';
import 'package:teresa/controllers/active_job_detail_controller/active_job_detail_controller.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
ApplyLeave(context) {
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
          height: Dimensions.height633,
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
                  Text("Apply Leave",style: TextStyle(
                      fontSize: Dimensions.height25,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: Dimensions.height40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Leave Category",style: TextStyle(
                        fontSize: Dimensions.height13,
                      ),),
                      DropdownButtonFormField(
                        hint: Text("Select category"),
                        validator: (value) {

                        },
                        value: activeJobDetailController.textValue,
                        items: activeJobDetailController.lstLeaveCategory.map((lang) {
                          return DropdownMenuItem(
                            value: lang.toString(),
                            child: Text(lang.toString()),
                          );
                        }).toList(),
                        onChanged: (val) {
                          print("ff");
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height30,),
                  Row(
                    children: [
                      Text("Single date"),
                      Switch(value: false, onChanged: (value){})
                    ],
                  ),
                  SizedBox(height: Dimensions.height21),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date between",
                        style: TextStyle(
                            fontSize: Dimensions.height11,
                            fontFamily: "Helvetica",
                            color: const Color(AppColors.STRONG_BLUE)
                        ),),
                      SizedBox(height: Dimensions.height5,),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          height: Dimensions.height25,
                          width: Dimensions.width131,
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
                  SizedBox(height: Dimensions.height21),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Leave Type",style: TextStyle(
                        fontSize: Dimensions.height13,
                      ),),
                      DropdownButtonFormField(
                        hint: Text("Select leave type"),
                        validator: (value) {

                        },
                        value: activeJobDetailController.textValue,
                        items: activeJobDetailController.lstLeaveCategory.map((lang) {
                          return DropdownMenuItem(
                            value: lang.toString(),
                            child: Text(lang.toString()),
                          );
                        }).toList(),
                        onChanged: (val) {
                          print("ff");
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height21),
                  Padding(
                    padding: EdgeInsets.only(top:2),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Reason"),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: TextFormField(
                              validator: (value) {

                              },
                              // controller: textController,
                              minLines: 6, // any number you need (It works as the rows for the textarea)
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                fillColor: Color(AppColors.LIGHT_GRAYISH_CYAN),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                                filled: true,

                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonButton(
                        name: "Cancel",
                        width: Dimensions.width135,
                        height: Dimensions.height45,
                        color: AppColors.STRONG_CYAN,
                        fontSize: Dimensions.height18,
                        radius: Dimensions.radius8,
                        onPressed: (){

                        },
                      ),
                      CommonButton(
                        name: "Submit",
                        width: Dimensions.width135,
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