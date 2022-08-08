import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/constants/icons/app_icons.dart';
class Attendance extends StatelessWidget {
  const Attendance({Key? key}) : super(key: key);

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
                    highlightColor:
                    Colors.blue.withOpacity(0.4),
                    splashColor:
                    Colors.green.withOpacity(0.5),
                    onTap: () {},
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
          SizedBox(height: Dimensions.height37,),
          Padding(
            padding: EdgeInsets.only(left: Dimensions.width32),
            child: Text("Attendance",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.height18
            ),),
          ),
          SizedBox(height: Dimensions.height10,),
          Padding(
            padding: EdgeInsets.only(left: Dimensions.width32),
            child: Row(
              children: [
                Container(
                  width: Dimensions.width28,
                  height: Dimensions.height28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/selma.png")
                    )
                  ),
                ),
                SizedBox(width: Dimensions.width10,),
                Text("Selma Gurung",style: TextStyle(
                  fontSize: Dimensions.height14,
                  color: Color(AppColors.STRONG_BLUE)
                ),),
                Text(" for Twilight Health")
              ],
            ),
          ),
          SizedBox(height: Dimensions.height40,),
          Container(
            height:Dimensions.height105,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width32,right: Dimensions.width32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("01/12/2020",style: TextStyle(
                          fontSize: Dimensions.height14,
                          color: Color(AppColors.STRONG_CYAN)
                      ),),
                      SizedBox(height: Dimensions.height16,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Check in",style: TextStyle(
                                  fontSize: Dimensions.height9,
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: Dimensions.height10,),
                              Text("8:05 am",style: TextStyle(
                                  fontSize: Dimensions.height9
                              ),),
                              SizedBox(height: Dimensions.height8,),
                              Container(
                                width: Dimensions.width68,
                                height: Dimensions.height22,
                                decoration: BoxDecoration(
                                    color: Color(AppColors.STRONG_CYAN),
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius8))
                                ),
                                child: Center(
                                  child: Text("Verified",style: TextStyle(
                                      color: Color(AppColors.WHITE),
                                      fontSize: Dimensions.height9
                                  ),),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text("Break",style: TextStyle(
                                  fontSize: Dimensions.height9,
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: Dimensions.height10,),
                              Text("1:05 am",style: TextStyle(
                                  fontSize: Dimensions.height9
                              ),),
                              SizedBox(height: Dimensions.height8,),
                              Text("1:35 am",style: TextStyle(
                                  fontSize: Dimensions.height9
                              ),)
                            ],
                          ),
                          Column(
                            children: [
                              Text("Check out",style: TextStyle(
                                  fontSize: Dimensions.height9,
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: Dimensions.height10,),
                              Text("5:05 am",style: TextStyle(
                                  fontSize: Dimensions.height9
                              ),),
                              SizedBox(height: Dimensions.height8,),
                              Container(
                                width: Dimensions.width68,
                                height: Dimensions.height22,
                                decoration: BoxDecoration(
                                    color: Color(AppColors.VIVID_RED),
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius8))
                                ),
                                child: Center(
                                  child: Text("Not Verified",style: TextStyle(
                                      color: Color(AppColors.WHITE),
                                      fontSize: Dimensions.height9
                                  ),),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: Dimensions.screenWidth,
                      height: Dimensions.height48,
                      decoration: BoxDecoration(
                          color: Color(AppColors.WHITE),
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffF1F1F1).withOpacity(0.0),
                              Color(0xffE5E5E5).withOpacity(0.4),
                            ],
                          )
                      ),
                    )),

              ],
            ),
          ),
        ],
      ),
    ));
  }
}
