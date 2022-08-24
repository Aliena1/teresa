import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/constants/icons/app_icons.dart';
import 'package:teresa/controllers/available_job_controller/available_job_controller.dart';
import 'package:teresa/models/available_jobs_model/available_jobs_model.dart';
import 'package:teresa/services/remote_services/remote_services.dart';
import 'package:teresa/views/dialogs/available_job_decline/available_job_decline.dart';
import 'package:teresa/views/pages/available_job/available_job_detail/available_job_detail.dart';
import 'package:teresa/views/pages/available_job/pdf_view_sheet/pdf_view_sheet.dart';
import 'package:teresa/views/pages/available_job/setting_menu/setting_menu.dart';
import 'package:teresa/views/pages/home/home_available_job/list_detail_components/list_detail_component.dart';
import 'package:teresa/views/pages/no_job_available/no_job_available.dart';
import 'package:teresa/views/pages/notification/notification.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
import 'package:teresa/views/widgets/common_textfield/common_textfield.dart';

class AvailableJob extends StatefulWidget {

  AvailableJob({Key? key}) : super(key: key);

  @override
  State<AvailableJob> createState() => _AvailableJobState();
}

class _AvailableJobState extends State<AvailableJob> {
  final availableJobController = Get.put(AvailableJobController());

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: const Color(AppColors.WHITE),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Dimensions.height27,
                left: Dimensions.width25,
                right: Dimensions.width25),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.end,
              children: [

                Container(
                  width: Dimensions.width50,
                  height: Dimensions.height50,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: IconButton(
                      alignment: Alignment.center,
                      splashRadius: Dimensions.height35,
                      constraints: BoxConstraints(),
                      onPressed: (){
                        Get.to(() =>
                            TeresaNotification());
                      }, icon: Stack(
                    children: [
                      Positioned(
                        bottom: Dimensions.height4,
                        right: Dimensions.width10,
                        child: Icon(Icons.notifications_none,
                          color: const Color(
                              AppColors.STRONG_BLUE),
                          size: Dimensions.height24,),),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: Dimensions.width17,
                            height: Dimensions.height17,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                BorderRadius.all(
                                    Radius.circular(
                                        Dimensions
                                            .radius100))),
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    color: const Color(
                                        AppColors.WHITE),
                                    fontSize:
                                    Dimensions.height9),
                              ),
                            ),))
                    ],
                  )),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimensions.height28,left: Dimensions.width32,right: Dimensions.width32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Available Job",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.height20
                ),),
                Obx(() => Row(
                  children: [
                    Container(
                      width: Dimensions.width41,
                      height: Dimensions.height50,
                      decoration: BoxDecoration(
                          color: availableJobController.isSetting.value?const Color(AppColors.STRONG_BLUE):Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius19),
                            topLeft: Radius.circular(Dimensions.radius19),
                          )
                      ),

                      child: IconButton(onPressed: (){
                        availableJobController.changeSetting();
                      }, icon: Icon(Icons.settings,size: Dimensions.height24,color:availableJobController.isSetting.value?Colors.white:const Color(AppColors.STRONG_BLUE),)),
                    ),
                    SizedBox(width: Dimensions.width10,),
                    Container(
                      width: Dimensions.width41,
                      height: Dimensions.height50,
                      decoration: BoxDecoration(
                          color: availableJobController.isFilter.value?const Color(AppColors.STRONG_BLUE):Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius19),
                            topLeft: Radius.circular(Dimensions.radius19),
                          )
                      ),

                      child: IconButton(onPressed: (){
                        availableJobController.changeFilter();
                      }, icon: Icon(Icons.tune,size: Dimensions.height24,color: availableJobController.isFilter.value?Colors.white:Color(AppColors.STRONG_BLUE),)),
                    )
                  ],
                ),)
              ],
            ),
          ),
          Obx(() => Visibility(
              visible: availableJobController.isFilter.value?true:false,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width26,right: Dimensions.width26,top: Dimensions.height22),
                width: Dimensions.screenWidth,
                height: Dimensions.height174,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(AppColors.STRONG_BLUE)),
                  color: Color(AppColors.STRONG_BLUE),
                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date between",
                              style: TextStyle(
                                  fontSize: Dimensions.height9,
                                  color: const Color(AppColors.WHITE)
                              ),),
                            SizedBox(height: Dimensions.height5,),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                height: Dimensions.height29,
                                width: Dimensions.width139,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.radius19)),
                                  color: const Color(AppColors.WHITE),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Work hours/ day",
                              style: TextStyle(
                                  fontSize: Dimensions.height9,
                                  color: const Color(AppColors.WHITE)
                              ),),
                            SizedBox(height: Dimensions.height5,),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                height: Dimensions.height29,
                                width: Dimensions.width139,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.radius19)),
                                  color: const Color(AppColors.WHITE),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.access_time_rounded,
                                        size: Dimensions.height11,
                                        color: const Color(AppColors.DARK_GRAY)),
                                    SizedBox(
                                      width: Dimensions.width5,
                                    ),
                                    Text("Select hour",
                                        style: TextStyle(
                                            fontFamily: "Helvetica",
                                            fontSize: Dimensions.height12,
                                            color: const Color(AppColors.DARK_GRAY))),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height:Dimensions.height29),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:Dimensions.width129,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Duration",
                                style: TextStyle(
                                    fontFamily: "Helvetica", fontSize: Dimensions.height12,color: Color(AppColors.WHITE)),
                              ),
                              Container(
                                height: Dimensions.height35,
                                child: TextFormField(
                                  validator: (value) {

                                  },
                                  controller: availableJobController.durationController,
                                  decoration: InputDecoration(
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                                      ),
                                      hintText: "Enter duration",
                                      hintStyle: TextStyle(
                                          fontFamily: "Helvetica", fontSize: Dimensions.height16,color: Color(AppColors.WHITE))),
                                ),
                              )
                            ],
                          ),
                        ),
                        CommonButton(
                          name: "Apply Filters",
                          width: Dimensions.width123,
                          height: Dimensions.height40,
                          color: AppColors.STRONG_CYAN,
                          radius: Dimensions.radius8,
                          fontSize: Dimensions.height13,
                          onPressed: (){},
                        )
                      ],
                    )
                  ],
                ),
              ))),
          Obx(() => Visibility(
              visible: availableJobController.isSetting.value?true:false,
              child: SettingMenu())),
          SizedBox(height: Dimensions.height30,),
          Flexible(child: GetBuilder<AvailableJobController>(init: AvailableJobController(),
              builder: (value) =>
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width8),
                child: PagedListView(
                  pagingController: availableJobController.pagingController,
                  builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, item, index) {
                        return Column(
                          children: [
                            AvailableListDetailComponent(declinePressed: (){
                            },
                              data: item,
                            ),
                            SizedBox(height: Dimensions.height30,),

                          ],
                        );

                      },
                      noItemsFoundIndicatorBuilder: (_) => NoJobAvailable()
                  ),
                ),
              )
          )
          ),


          // Flexible(child: AvailableListDetailComponent())
        ],
      ),
    ));
  }
}


