import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/controllers/home_active_job_controller/home_active_job_controller.dart';
import 'package:teresa/views/pages/active_job/active_job_detail/active_job_detail.dart';
import 'package:teresa/views/pages/home/home_active_jobs/components/list_detail_component/list_detail_component.dart';
import 'package:teresa/views/pages/no_job_available/no_job_available.dart';
class HomeActiveJobs extends StatelessWidget {
  HomeActiveJobs({Key? key}) : super(key: key);
  HomeActiveJobController homeActiveJobController=Get.put(HomeActiveJobController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left:Dimensions.width21,right: Dimensions.width21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Active job",style: TextStyle(
                    fontSize: Dimensions.height20,
                    fontFamily: "Helvetica",
                  fontWeight: FontWeight.bold
                ),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date active",
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
                        height: Dimensions.height23,
                        width: Dimensions.width107,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_month_outlined,
                                size: Dimensions.height14,
                                color: Color(AppColors.DARK_GRAY)),
                            SizedBox(
                              width: Dimensions.width5,
                            ),
                            Text("select date",
                                style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontSize: Dimensions.height12,
                                    color: const Color(AppColors.DARK_GRAY)))
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: Dimensions.height11,),
          Flexible(child: PagedListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: Dimensions.height20,),
            pagingController: homeActiveJobController.pagingController,
            builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) {
                  return ListDetailComponent(
                    data: item,
                  );

                },
                noItemsFoundIndicatorBuilder: (_) => NoJobAvailable()
            ),
          )),
          // SizedBox(height: Dimensions.height20,)
        ],
      ),
    );
  }
}
