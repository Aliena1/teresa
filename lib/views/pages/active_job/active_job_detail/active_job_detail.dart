import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/constants/icons/app_icons.dart';
import 'package:teresa/controllers/active_job_controller/active_job_controller.dart';
import 'package:teresa/controllers/active_job_detail_controller/active_job_detail_controller.dart';
import 'package:teresa/views/dialogs/active_job_break_enable/active_job_break_enable.dart';
import 'package:teresa/views/dialogs/active_job_check_in_out/active_job_check_in_out.dart';
import 'package:teresa/views/dialogs/apply_leave/apply_leave.dart';
import 'package:teresa/views/pages/active_job/attendance/attendance.dart';
import 'package:teresa/views/pages/available_job/pdf_view_sheet/pdf_view_sheet.dart';
import 'package:teresa/views/pages/notification/notification.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
class ActiveJobDetail extends StatelessWidget {
  ActiveJobDetail({Key? key}) : super(key: key);
  ActiveJobDetailController activeJobDetailController=Get.put(ActiveJobDetailController());
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  List image=["assets/list1.jpg","assets/list2.jpg"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: Dimensions.height27,
                        left: Dimensions.width25,
                        right: Dimensions.width25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            highlightColor: Colors.blue.withOpacity(0.4),
                            splashColor: Colors.green.withOpacity(0.5),
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: Dimensions.width40,
                              height: Dimensions.height40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(AppColors.WHITE),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(AppColors.GRAYISH_BLUE)
                                        .withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(
                                        1, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: RotatedBox(
                                  quarterTurns: 2,
                                  child: Icon(
                                    AppIcons.PLAY_ARROW,
                                    color: const Color(AppColors.STRONG_BLUE),
                                    size: Dimensions.height24,
                                  )),
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/icon.png",
                          height: Dimensions.height58,
                        ),
                        Container(
                          width: Dimensions.width50,
                          height: Dimensions.height50,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: IconButton(
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
                  Flexible(
                    child: GoogleMap(
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: false,
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  )
                ],
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.25,
                minChildSize: 0.25,
                maxChildSize: 1,
                snapSizes: [0.5, 1],
                snap: true,
                builder: (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(AppColors.WHITE),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius19),
                            topRight: Radius.circular(Dimensions.radius19))),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Obx(() => activeJobDetailController.jobDetail.isNotEmpty?Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(top: Dimensions.height5),
                              width:Dimensions.width139,
                              child: Divider(
                                color: Color(AppColors.LIGHT_GRAYISH_CYAN),
                                thickness: Dimensions.height4,
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
                                  activeJobDetailController.jobDetail[0].company,
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
                                  activeJobDetailController.jobDetail[0].companyLocation,
                                  style: TextStyle(
                                      fontFamily: "Helvetica",
                                      fontSize: Dimensions.height9,
                                      color: const Color(AppColors.MODERATE_BLUE)),
                                ),
                                SizedBox(
                                  height: Dimensions.height8,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.height21,
                                left: Dimensions.width32,
                                right: Dimensions.width32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: Dimensions.width44,
                                      height: Dimensions.height44,
                                      decoration: BoxDecoration(
                                        color: Color(AppColors.WHITE),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image:
                                            AssetImage("assets/maplocater.png")),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: Offset(
                                                1, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height13,
                                    ),
                                    Text(
                                      "Find Route",
                                      style: TextStyle(
                                        fontSize: Dimensions.height13,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: Dimensions.width44,
                                      height: Dimensions.height44,
                                      decoration: BoxDecoration(
                                        color: Color(AppColors.WHITE),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: Offset(
                                                1, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.call,
                                        color: Color(AppColors.STRONG_CYAN),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height13,
                                    ),
                                    Text(
                                      "Call",
                                      style: TextStyle(
                                        fontSize: Dimensions.height13,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: Dimensions.width44,
                                      height: Dimensions.height44,
                                      decoration: BoxDecoration(
                                        color: Color(AppColors.WHITE),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: Offset(
                                                1, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.navigation,
                                        color: Color(AppColors.STRONG_CYAN),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height13,
                                    ),
                                    Text(
                                      "Navigation",
                                      style: TextStyle(
                                        fontSize: Dimensions.height13,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.height30,
                                left: Dimensions.width32,
                                right: Dimensions.width32),
                            child: Divider(
                              color: Color(AppColors.LIGHT_GRAYISH_CYAN),
                              thickness: Dimensions.height3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.height14,
                                left: Dimensions.width32,
                                right: Dimensions.width32),
                            child: Text(
                              "Actions",
                              style: TextStyle(
                                fontSize: Dimensions.height13,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height12,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width66),
                              child: Column(
                                children: [
                                  CommonButton(
                                    name: "Update Check in/out",
                                    color: activeJobDetailController.jobDetail[0].status==false?AppColors.VERY_DARK_GRAY:AppColors.STRONG_BLUE,
                                    radius: Dimensions.radius8,
                                    fontSize: Dimensions.height18,
                                    height: Dimensions.height45,
                                    width: Dimensions.screenWidth,
                                    onPressed: () {
                                      activeJobDetailController.jobDetail[0].status==false?null:ActiveJobCheckInOut(context);
                                    },
                                  ),
                                  SizedBox(
                                    height: Dimensions.height18,
                                  ),
                                  CommonButton(
                                    name: "Enable break",
                                    color: activeJobDetailController.jobDetail[0].status==false?AppColors.VERY_DARK_GRAY:AppColors.STRONG_CYAN,
                                    radius: Dimensions.radius8,
                                    fontSize: Dimensions.height18,
                                    height: Dimensions.height45,
                                    width: Dimensions.screenWidth,
                                    onPressed: () {
                                      activeJobDetailController.jobDetail[0].status==false?null:ActiveJobEnableBreak(context);
                                    },
                                  ),
                                  SizedBox(
                                    height: Dimensions.height18,
                                  ),
                                  CommonButton(
                                    name: "check attendance",
                                    color: AppColors.STRONG_CYAN,
                                    radius: Dimensions.radius8,
                                    fontSize: Dimensions.height18,
                                    height: Dimensions.height45,
                                    width: Dimensions.screenWidth,
                                    onPressed: () {
                                      Get.to(()=>Attendance());
                                    },
                                  ),
                                  SizedBox(
                                    height: Dimensions.height18,
                                  ),
                                  CommonButton(
                                    name: "Apply Leave",
                                    color: AppColors.STRONG_CYAN,
                                    radius: Dimensions.radius8,
                                    fontSize: Dimensions.height18,
                                    height: Dimensions.height45,
                                    width: Dimensions.screenWidth,
                                    onPressed: () {
                                      ApplyLeave(context);
                                    },
                                  ),
                                  SizedBox(
                                    height: Dimensions.height18,
                                  ),
                                  CommonButton(
                                    name: "Cancel Job",
                                    color: AppColors.VIVID_RED,
                                    radius: Dimensions.radius8,
                                    fontSize: Dimensions.height18,
                                    height: Dimensions.height45,
                                    width: Dimensions.screenWidth,
                                    onPressed: () {},
                                  )
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.height30,
                                left: Dimensions.width32,
                                right: Dimensions.width32),
                            child: Divider(
                              color: Color(AppColors.LIGHT_GRAYISH_CYAN),
                              thickness: Dimensions.height3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: Dimensions.width32),
                            child: Text(
                              "Details",
                              style: TextStyle(
                                  fontSize: Dimensions.height15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height18,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.width40, right: Dimensions.width40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Report to",
                                      style: TextStyle(
                                          fontSize: Dimensions.height9,
                                          color: Color(AppColors.STRONG_BLUE)),
                                    ),
                                    Text(
                                      activeJobDetailController.jobDetail[0].companyReportPerson,
                                      style: TextStyle(fontSize: Dimensions.height13),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Shift dates",
                                      style: TextStyle(
                                          fontSize: Dimensions.height9,
                                          color: Color(AppColors.STRONG_BLUE)),
                                    ),
                                    Container(
                                      width: Dimensions.screenWidth * 0.20,
                                      child: Text(
                                        "${activeJobDetailController.jobDetail[0].startDate} - ${activeJobDetailController.jobDetail[0].endDate}",
                                        style:
                                        TextStyle(fontSize: Dimensions.height13),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.width32, right: Dimensions.width32),
                            child: Container(
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
                                        color: const Color(AppColors.MODERATE_BLUE)),
                                  ),
                                  Text(
                                    "\$${activeJobDetailController.jobDetail[0].baseRateForJobseeker}/hr",
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
                                left: Dimensions.width40,
                                right: Dimensions.width36,
                                top: Dimensions.height16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                              color: Color(AppColors.MODERATE_BLUE)),
                                        ),
                                        SizedBox(
                                          height: Dimensions.height2,
                                        ),
                                        Text(
                                          "${activeJobDetailController.jobDetail[0].startTime} - ",
                                          style: TextStyle(
                                              fontFamily: "Helvetica",
                                              fontSize: Dimensions.height13),
                                        ),
                                        SizedBox(
                                          height: Dimensions.height2,
                                        ),
                                        Text(
                                          activeJobDetailController.jobDetail[0].endTime,
                                          style: TextStyle(
                                              fontFamily: "Helvetica",
                                              fontSize: Dimensions.height13),
                                        )
                                      ],
                                    ),
                                    Column(
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
                                          "${activeJobDetailController.jobDetail[0].totalDuration} Hours/Day",
                                          style: TextStyle(
                                              fontFamily: "Helvetica",
                                              fontSize: Dimensions.height13),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.height30,
                                left: Dimensions.width32,
                                right: Dimensions.width32),
                            child: Divider(
                              color: const Color(AppColors.LIGHT_GRAYISH_CYAN),
                              thickness: Dimensions.height3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.height30,
                                left: Dimensions.width32,
                                right: Dimensions.width32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Job details (pdf):",
                                  style: TextStyle(
                                      fontSize: Dimensions.height15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: Dimensions.height15,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                                  child: CommonButton(
                                    name: "View the job details PDF",
                                    width: Dimensions.screenWidth,
                                    height: Dimensions.height45,
                                    fontSize: Dimensions.height15,
                                    radius: Dimensions.radius8,
                                    color: AppColors.STRONG_BLUE,
                                    onPressed: () {
                                      PdfViewSheet(context,activeJobDetailController.jobDetail[0].path,activeJobDetailController.jobDetail[0].jobDetailPdfFile);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.height20,
                                left: Dimensions.width32,
                                right: Dimensions.width32),
                            child: Divider(
                              color: const Color(AppColors.LIGHT_GRAYISH_CYAN),
                              thickness: Dimensions.height3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:Dimensions.height20,left: Dimensions.width46,bottom: Dimensions.height14),
                            child: Text("Images",style: TextStyle(
                                fontSize: Dimensions.height13
                            ),),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: Dimensions.width23),
                              height: Dimensions.height185,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: image.length,
                                itemBuilder: (context,index){
                                  return Container(
                                    width: Dimensions.width287,
                                    height: Dimensions.height185,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius8)),
                                        image: DecorationImage(image: AssetImage(image[index]),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  );
                                }, separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(width: Dimensions.width10,);
                              },)),
                          SizedBox(height: Dimensions.height40,)
                        ],
                      ):Text("No data")),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}