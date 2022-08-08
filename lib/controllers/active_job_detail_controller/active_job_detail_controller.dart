import 'package:get/get.dart';
import 'package:teresa/models/available_job_detail_model/available_job_detail_model.dart';
import 'package:teresa/repository/active_job_detail_repository/active_job_detail_repository.dart';
import 'package:teresa/views/pages/available_job/available_job_detail/available_job_detail.dart';

class ActiveJobDetailController extends GetxController {
 var textValue;
 // String jobId="";
 List lstLeaveCategory = ["a", "b"];
 List lstLeaveType = ["a", "b"];
 ActiveJobDetailRepository activeJobDetailRepository = ActiveJobDetailRepository();
 var jobDetail=[].obs;


 // @override
 //  void onInit() {
 //    super.onInit();
 //  }

 void getJobDetail(jobId) async {
  try {
   var queryParameters = {
    "jobId": jobId
   };
   await activeJobDetailRepository.getJobDetail(queryParameters).then((value) {
    jobDetail.clear();
    final response = AvailableJobDetailResponse.fromJson(value);
    jobDetail.add(response);
   });
  }
  catch (e) {
   throw Exception(e.toString());
  }
 }
}