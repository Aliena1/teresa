import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/constants/icons/app_icons.dart';
import 'package:teresa/views/dialogs/schedule_available_time/schedule_available_time.dart';
import 'package:teresa/views/pages/notification/notification.dart';
import 'package:teresa/views/pages/schedule/available_time_job/available_time_job.dart';
import 'package:teresa/views/pages/schedule/job_schedule/job_schedule.dart';
import 'package:teresa/views/pages/schedule/view_jobs/view_jobs.dart';
import 'package:get/get.dart';
class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController();

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Dimensions.height27,
                left: Dimensions.width25,
                right: Dimensions.width25),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Dimensions.width40,
                  height: Dimensions.height40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
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
            padding: EdgeInsets.only(top: Dimensions.height28,left: Dimensions.width36,bottom: Dimensions.height11),
            child: Text("Schedule",style: TextStyle(
              fontSize: Dimensions.height20,
              fontWeight: FontWeight.bold
            ),),
          ),
          Container(
            color: Colors.green,
            height: Dimensions.height150,
            child: Stack(
              children: [
                Container(
                  height: Dimensions.height150,
                  foregroundDecoration: const BoxDecoration(
                    color: Color(AppColors.WHITE),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(AppColors.WHITE),
                    border: Border.all(color: const Color(AppColors.WHITE))
                  ),
                ),
                Container(
                  height: Dimensions.height130,
                  color: const Color(AppColors.STRONG_BLUE),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: Dimensions.height100,
                        child: ListView.builder(
                          itemCount: 365,
                          physics: NeverScrollableScrollPhysics(),
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    currentDateSelectedIndex = index;
                                    selectedDate =
                                        DateTime.now().add(Duration(days: index));
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        currentDateSelectedIndex == index
                                            ? Container(
                                          padding: EdgeInsets.only(top: Dimensions.height10),
                                          height: Dimensions.height96,
                                          width: Dimensions.width44,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      1), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius:
                                              BorderRadius.circular(
                                                  Dimensions.radius100),
                                              color:
                                              const Color(AppColors.WHITE)),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.calendar_month,size: Dimensions.height12,color: Color(AppColors.STRONG_BLUE),),
                                              SizedBox(
                                                height: Dimensions.height5,
                                              ),
                                              Text(
                                                DateTime.now()
                                                    .add(Duration(
                                                    days: index))
                                                    .day
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize:
                                                    Dimensions.height17,
                                                    color:
                                                    currentDateSelectedIndex ==
                                                        index
                                                        ? Color(AppColors
                                                        .STRONG_BLUE)
                                                        : Colors.white),
                                              ),
                                              SizedBox(
                                                height: Dimensions.height5,
                                              ),
                                              Text(
                                                listOfMonths[DateTime.now()
                                                    .add(Duration(
                                                    days:
                                                    index))
                                                    .month -
                                                    1]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize:
                                                    Dimensions.height12,
                                                    color:
                                                    currentDateSelectedIndex ==
                                                        index
                                                        ? Color(AppColors
                                                        .STRONG_BLUE)
                                                        : Colors.white),
                                              ),
                                            ],
                                          ),
                                        )
                                            : Container(
                                          padding: EdgeInsets.only(top: Dimensions.height10),
                                          height: Dimensions.height80,
                                          width: Dimensions.width50,
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                listOfDays[DateTime.now()
                                                    .add(Duration(
                                                    days:
                                                    index))
                                                    .weekday -
                                                    1]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize:
                                                    Dimensions.height12,
                                                    color:
                                                    currentDateSelectedIndex ==
                                                        index
                                                        ? Colors.white
                                                        : Colors.white),
                                              ),
                                              SizedBox(
                                                height: Dimensions.height5,
                                              ),
                                              Text(
                                                DateTime.now()
                                                    .add(Duration(
                                                    days: index))
                                                    .day
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize:
                                                    Dimensions.height17,
                                                    color:
                                                    currentDateSelectedIndex ==
                                                        index
                                                        ? Colors.white
                                                        : Colors.white),
                                              ),
                                              SizedBox(
                                                height: Dimensions.height5,
                                              ),
                                              Text(
                                                listOfMonths[DateTime.now()
                                                    .add(Duration(
                                                    days:
                                                    index))
                                                    .month -
                                                    1]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize:
                                                    Dimensions.height12,
                                                    color:
                                                    currentDateSelectedIndex ==
                                                        index
                                                        ? Colors.white
                                                        : Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ));
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: Dimensions.height11,
                  child: Padding(
                    padding: EdgeInsets.only(left: Dimensions.width36,right: Dimensions.width26),
                    child: Row(
                      children: [
                        Container(
                          width: Dimensions.width16,
                          height: Dimensions.height16,
                          decoration: const BoxDecoration(
                            color: Color(AppColors.WHITE),
                            shape: BoxShape.circle
                          ),
                          child: RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                AppIcons.PLAY_ARROW,
                                color: const Color(
                                    AppColors.STRONG_BLUE),
                                size: Dimensions.height12,
                              )),
                        ),
                        SizedBox(width: Dimensions.width17,),
                        Container(
                          width: Dimensions.width16,
                          height: Dimensions.height16,
                          decoration: const BoxDecoration(
                              color: Color(AppColors.WHITE),
                              shape: BoxShape.circle
                          ),
                          child: RotatedBox(
                              quarterTurns: 0,
                              child: Icon(
                                AppIcons.PLAY_ARROW,
                                color: const Color(
                                    AppColors.STRONG_BLUE),
                                size: Dimensions.height12,
                              )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: Dimensions.height21,),
          Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.width22),child: ViewJobs(onPressed:(){
              availableTimeJob(context);
          }),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width22,vertical: Dimensions.height21),
            child: JobSchedule(),
          )
        ],
      ),
          floatingActionButton: Container(
            width: Dimensions.width49,
            height: Dimensions.height49,
            child: FloatingActionButton(
                backgroundColor: const Color(AppColors.STRONG_BLUE),
                child: Icon(Icons.add,size: Dimensions.height24,),
                onPressed: (){
                  AvailableTime(context);
                }),
          ),
    )
    );
  }
}
