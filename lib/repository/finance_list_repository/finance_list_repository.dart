import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/services/remote_services/remote_services.dart';

class FinanceListRepository{
  Future<dynamic> getFinanceList(queryParameters) async{
    return await RemoteServices.getMethodWithParams(ApiConstants.AVAILABLE_FINANCE_LIST, queryParameters);
  }
}