import 'dart:convert';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teresa/models/login_model/login_model.dart';
import 'package:teresa/models/withdraw_list_model/withdraw_list_model.dart';
import 'package:teresa/repository/withdraw_list_repository/withdraw_list_repository.dart';

class WithdrawListController extends GetxController{
  final withdrawListRepo=WithdrawListRepository();
  static const _pageSize = 5;
  RxString walletAmount="".obs;
  final PagingController _pagingController =
  PagingController(firstPageKey: 1,invisibleItemsThreshold: 1);
  PagingController get pageController => _pagingController;

  @override
  void onInit() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    getWalletAmount();
    super.onInit();
  }

  @override
  void dispose(){
    _pagingController.dispose();
    super.dispose();
  }

  void getWalletAmount() async{
      final prefs=await SharedPreferences.getInstance();
      var temp=jsonDecode(prefs.getString("userDetail")!);
      final userDetails=UserDetails.fromJson(temp);
      walletAmount.value=userDetails.walletAmount.toString();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var queryParameters={
        "per_page":_pageSize.toString(),
        "page":pageKey.toString(),
        "from_date":"2021-12-15",
        "to_Date":"2022-12-15"
      };
      await withdrawListRepo.getWithdrawList(queryParameters).then((value) {
        final newItems=WithdrawListResponse.fromJson(value);
        final isLastPage = newItems.transactionLists!.data!.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems.transactionLists!.data!);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(newItems.transactionLists!.data!,nextPageKey);
        }
      });
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}