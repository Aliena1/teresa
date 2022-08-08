import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/services/remote_services/remote_services.dart';

class ActiveJobDetailRepository{
  Future<dynamic> getJobDetail(queryParameters) async{
    return await RemoteServices.getMethodWithParams(ApiConstants.AVAILABLE_JOBS_DETAIL, queryParameters);
  }
}