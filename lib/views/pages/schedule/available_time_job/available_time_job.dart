
import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/views/pages/available_job/available_job_detail/available_job_detail.dart';
import 'package:teresa/views/pages/home/home_available_job/list_detail_components/list_detail_component.dart';
availableTimeJob(context){
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context, builder: (context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
        color: const Color(AppColors.WHITE),
        width: Dimensions.screenWidth,
        height: Dimensions.screenHeight*0.90,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Dimensions.height15),
              child: Container(
                width: Dimensions.width120,
                height: Dimensions.height2,
                color: const Color(AppColors.DARK_GRAY),
              ),
            ),
            SizedBox(height: Dimensions.height25,),
            Container(
              width: Dimensions.screenWidth*0.70,
              child: Text("Jobs available at your available time",style: TextStyle(
                  fontSize: Dimensions.height20,
                  fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: Dimensions.height25,),
            Flexible(
              child: ListView.separated(
                  itemCount: 2,
                  itemBuilder: (context,index){
                    return AvailableListDetailComponent(declinePressed: (){},);
              }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: Dimensions.height17,);
              },),
            )
          ],
        )
    );
  });
}
