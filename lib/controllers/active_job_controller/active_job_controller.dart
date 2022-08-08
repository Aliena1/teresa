import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/models/active_job_model/active_job_model.dart';
import 'package:teresa/services/remote_services/remote_services.dart';
class ActiveJobController extends GetxController{
  static const _pageSize = 5;
  final PagingController _pagingController =
  PagingController(firstPageKey: 1,invisibleItemsThreshold: 1);
  TextEditingController durationController=TextEditingController();
  PagingController get pagingController => _pagingController;
  RxBool isFilter=false.obs;


  @override
  void onInit() {
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
      await RemoteServices.getMethodWithParams(ApiConstants.ACTIVE_JOBS,queryParameters).then((value) {
        final newItems=ActiveJobResponse.fromJson(value);
        final isLastPage = newItems.activeJobsList!.data!.length < _pageSize;
        print(newItems.meta!.currentPage.toString());
        print(newItems.meta!.perPage);
        if (isLastPage) {
          _pagingController.appendLastPage(newItems.activeJobsList!.data!);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(newItems.activeJobsList!.data!,nextPageKey);


        }
      });


    } catch (error) {
      throw Exception(error.toString());
    }
  }

}