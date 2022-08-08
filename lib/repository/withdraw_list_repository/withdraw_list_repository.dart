import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/services/remote_services/remote_services.dart';

class WithdrawListRepository{
  Future<dynamic> getWithdrawList(queryParameters) async{
    return await RemoteServices.getMethodWithParams(ApiConstants.WITHDRAW_LIST, queryParameters);
  }
}