import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/models/finance_list_model/finance_list_model.dart';
import 'package:teresa/repository/finance_list_repository/finance_list_repository.dart';
import 'package:teresa/services/remote_services/remote_services.dart';

class FinanceListController extends GetxController{
  static const _pageSize = 5;
  final PagingController _pagingController =
  PagingController(firstPageKey: 1,invisibleItemsThreshold: 1);
  final financeListRepo=FinanceListRepository();
  late RxString fromDate;
 late RxString toDate;
  PagingController get pageController => _pagingController;

  @override
  void onInit() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    fromDate="".obs;
    toDate="".obs;
    super.onInit();
  }

  @override
  void dispose(){
    _pagingController.dispose();
    fromDate.value="";
    toDate.value="";
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var queryParameters={
        "per_page":_pageSize.toString(),
        "page":pageKey.toString(),
        "from_date":fromDate.value,
        "to_Date":toDate.value
      };
      await financeListRepo.getFinanceList(queryParameters).then((value) {
        final newItems=FinanceListResponse.fromJson(value);
        final isLastPage = newItems.jobseekerFinanceList!.data!.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems.jobseekerFinanceList!.data!);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(newItems.jobseekerFinanceList!.data!,nextPageKey);
        }
      });
    } catch (error) {
      throw Exception(error.toString());
    }
  }



  double getBreakTime(time) => time*60;

  String getTotalHours(time){
    int num1 = time.toInt();
    double num2=time-num1;
    double num3=num2*60;
    return "$num1 hours ${num3.round()} minutes";
  }


  void filterFinanceList(pageKey) async{
    _pagingController.refresh();
    try {
      var queryParameters={
        "per_page":_pageSize.toString(),
        "page":pageKey.toString(),
        "from_date":fromDate.value,
        "to_Date":toDate.value
      };
      await financeListRepo.getFinanceList(queryParameters).then((value) {
        final newItems=FinanceListResponse.fromJson(value);
        final isLastPage = newItems.jobseekerFinanceList!.data!.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems.jobseekerFinanceList!.data!);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(newItems.jobseekerFinanceList!.data!,nextPageKey);
        }
      });
    } catch (error) {
      throw Exception(error.toString());
    }
  }


  Future<void> fromDateFinance(context) async {
    final DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 7),
        lastDate: DateTime.now(),
        helpText: 'Select a date',
        fieldHintText: "dkdsknjk"
    ).then((selectedDate) {
      if (selectedDate != null) {
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formatted = formatter.format(selectedDate);
        fromDate.value=formatted;
      }
    });
  }

  Future<void> toDateFinance(context) async {
    final DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 7),
        lastDate: DateTime.now(),
        helpText: 'Select a date',
        fieldHintText: "dkdsknjk"
    ).then((selectedDate) {
      if (selectedDate != null) {
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formatted = formatter.format(selectedDate);
        toDate.value=formatted;
        _pagingController.refresh();
      }
    });
  }
}