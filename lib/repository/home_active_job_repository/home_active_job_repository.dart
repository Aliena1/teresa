import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/services/remote_services/remote_services.dart';

class HomeActiveJobRepository{
  Future<dynamic> getActiveJob(queryParameters) async{
    return await RemoteServices.getMethodWithParams(ApiConstants.ACTIVE_JOBS,queryParameters);
  }
}