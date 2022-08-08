import 'package:teresa/repository/available_job_detail_repository/available_job_detail_respository.dart';

class AvailableJobDetailController{
  String jobId="";
  final availableJobDetailRepo=AvailableJobDetailRepository();

 void getJobDetail() async{
   var queryParameters={
     "jobId":jobId
   };
   await availableJobDetailRepo.getJobDetail(queryParameters).then((value) {
     print(value);
   });
 }
}