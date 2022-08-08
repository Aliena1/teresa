import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:teresa/models/available_jobs_model/available_jobs_model.dart';
import 'package:teresa/repository/home_available_job_repository/home_available_job_repository.dart';

class HomeAvailableJobController extends GetxController{
  static const _pageSize = 5;
  final PagingController _pagingController =
  PagingController(firstPageKey: 1,invisibleItemsThreshold: 1);
  TextEditingController durationController=TextEditingController();
  PagingController get pagingController => _pagingController;
  RxBool isFilter=false.obs;
  HomeAvailableJobRepository homeAvailableJobRepository=HomeAvailableJobRepository();


  @override
  void onInit() {
    print("sth special");
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    _pagingController.dispose();
    super.onClose();
  }

  void changeFilter(){
    isFilter.value=!isFilter.value;
  }


  Future<void> _fetchPage(int pageKey) async {
    try {
      var queryParameters={
        "per_page":_pageSize.toString(),
        "page":pageKey.toString(),
      };
      await homeAvailableJobRepository.getAvailableJob(queryParameters).then((value) {
        final newItems=AvailableJobsResponse.fromJson(value);
        final isLastPage = newItems.availableJobsList!.data!.length < _pageSize;
        print(newItems.meta!.currentPage.toString());
        print(newItems.meta!.perPage);
        if (isLastPage) {
          _pagingController.appendLastPage(newItems.availableJobsList!.data!);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(newItems.availableJobsList!.data!,nextPageKey);


        }
      });


    } catch (error) {
      throw Exception(error.toString());
    }
  }

}