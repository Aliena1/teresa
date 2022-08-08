import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/constants/icons/app_icons.dart';
import 'package:teresa/views/pages/notification/notification_list/notification_list.dart';
class TeresaNotification extends StatelessWidget {
  TeresaNotification({Key? key}) : super(key: key);

  List notificationlst=[{"text1":"Your leave application for","boldText":"New Heathens Hospital","text3":"was approved","image":"assets/hospital.png","type":"success"},
    {"text1":"Payment for","boldText":"12/05/2020-01/05/2021","text3":"has been deposited into your account.","image":"assets/hospital.png","type":"success"},
    {"text1":"Job for","boldText":"New Heathens Hospital","text3":"active in 3 hours","image":"assets/hospital.png","type":"success"},
    {"text1":"Job for","boldText":"New Heathens Hospital","text3":"has been cancelled","image":"assets/hospital.png","type":"cancel"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: new CircleBorder(),
                    highlightColor:
                    Colors.blue.withOpacity(0.4),
                    splashColor:
                    Colors.green.withOpacity(0.5),
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
                            color: const Color(
                                AppColors.GRAYISH_BLUE)
                                .withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(1,
                                2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            AppIcons.PLAY_ARROW,
                            color: const Color(
                                AppColors.STRONG_BLUE),
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
                  width: Dimensions.width40,
                  height: Dimensions.height40,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: Dimensions.height10,
                          child: Icon(
                            Icons.notifications_none,
                            color: const Color(
                                AppColors.STRONG_BLUE),
                            size: Dimensions.height24,
                          )),
                      Positioned(
                          top: 0,
                          right: Dimensions.width5,
                          child: Container(
                            width: Dimensions.width17,
                            height: Dimensions.height14,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                BorderRadius.all(
                                    Radius.circular(
                                        Dimensions
                                            .radius19))),
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    color: const Color(
                                        AppColors.WHITE),
                                    fontSize:
                                    Dimensions.height9),
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: Dimensions.height28,),
          Padding(padding: EdgeInsets.only(left: Dimensions.width36),child: Text("Notifications",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.height20
          ),),),
          SizedBox(height: Dimensions.height22,),
          Flexible(
              child: ListView.builder(

                  itemCount: notificationlst.length,
                  itemBuilder: (context,index){

            return Column(
              children: [
              NotificationList(image: notificationlst[index]["image"],text1: notificationlst[index]["text1"],boldText: notificationlst[index]["boldText"],text3: notificationlst[index]["text3"],type: notificationlst[index]["type"]),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width21),
                  child: Divider(
                      color: Colors.grey,
                      thickness: 2,
                      ),
                )
              ],
            );
          },)
          )
        ],
      ),
    ));
  }
}
