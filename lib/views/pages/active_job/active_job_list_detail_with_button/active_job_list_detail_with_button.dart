import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/controllers/active_job_detail_controller/active_job_detail_controller.dart';
import 'package:teresa/views/pages/active_job/active_job_detail/active_job_detail.dart';
import 'package:teresa/views/pages/home/home_active_jobs/components/list_detail_component/list_detail_component.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
import 'package:get/get.dart';
class ActiveJobListDetailWithButton extends StatelessWidget {
  ActiveJobListDetailWithButton({Key? key,this.data}) : super(key: key);
  var data;
  ActiveJobDetailController activeJobDetailController=Get.put(ActiveJobDetailController());

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.all(Radius.circular(Dimensions.radius19)),
        color: Colors.transparent,

      ),
      height: Dimensions.height335,
      child: Stack(
        children: [
          ListDetailComponent(data:data),
          Positioned(
            bottom: 0,
            width: Dimensions.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonButton(
                  width: Dimensions.width93,
                  height: Dimensions.height52,
                  onPressed: (){
                    activeJobDetailController.getJobDetail(data.jobId.toString());
                    Get.to(()=>ActiveJobDetail());
                  },
                  color: AppColors.STRONG_BLUE,
                  name: "Details",
                  radius: Dimensions.radius8,
                  fontSize: Dimensions.height13,
                ),
                SizedBox(
                  width: Dimensions.width25,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
