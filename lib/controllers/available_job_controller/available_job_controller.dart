import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teresa/repository/available_jobs_repository/available_jobs_repository.dart';

class AvailableJobController{
  TextEditingController durationController=TextEditingController();
  RxBool isFilter=false.obs;
  RxBool isSetting=false.obs;
  // final availableJobsRepo=AvailableJobsRepository();

  void changeFilter(){
    if(isSetting.value){
      isSetting.value=false;
    }
    isFilter.value=!isFilter.value;
  }

  void changeSetting(){
    if(isFilter.value){
      isFilter.value=false;
    }
    isSetting.value=!isSetting.value;
    print(isFilter.value);
  }


  // void getAvailableJobs(per_page, page, date) async{
  //   await availableJobsRepo.getAvailableJobs(per_page, page, date).then((value) => print(value));
  // }
}