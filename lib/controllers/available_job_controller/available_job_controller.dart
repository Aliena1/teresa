import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:teresa/repository/available_jobs_repository/available_jobs_repository.dart';

import '../../constants/api_constants/api_constant.dart';
import '../../models/available_jobs_model/available_jobs_model.dart';
import '../../services/remote_services/remote_services.dart';
import '../../views/dialogs/loader/loader_dialog.dart';

class AvailableJobController extends GetxController{
  TextEditingController durationController=TextEditingController();
  RxBool isFilter=false.obs;
  RxBool isSetting=false.obs;
  static const _pageSize = 5;
  final PagingController pagingController = PagingController(firstPageKey: 1,invisibleItemsThreshold: 1);

  @override
  void onInit() {
    print('controller init');
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  } // final availableJobsRepo=AvailableJobsRepository();



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
  Future<void> fetchPage(int pageKey) async {
    print('fetch page called = $pageKey');
    try {
      var queryParameters={
        "per_page":_pageSize.toString(),
        "page":pageKey.toString(),
      };
      await RemoteServices.getMethodWithParams(ApiConstants.AVAILABLE_JOBS,queryParameters).then((value) {
        final newItems=AvailableJobsResponse.fromJson(value);
        final isLastPage = newItems.availableJobsList!.data!.length < _pageSize;
        print("current page = ${newItems.meta!.currentPage.toString()}");
        // print(newItems.meta!.perPage);
        if (isLastPage) {
          print('in last page');
          pagingController.appendLastPage(newItems.availableJobsList!.data!);
        } else {
          print('else else');
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(newItems.availableJobsList!.data!,nextPageKey);
        }
        update();

      });
    } catch (error) {
      throw Exception(error.toString());
    }
  }


  // void getAvailableJobs(per_page, page, date) async{
  //   await availableJobsRepo.getAvailableJobs(per_page, page, date).then((value) => print(value));
  // }
}