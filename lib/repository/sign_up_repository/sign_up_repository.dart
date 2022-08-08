import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/services/remote_services/remote_services.dart';

class SignUpRepository{
  Future<dynamic> registerUser(map) async{
    return await RemoteServices.postMethod(ApiConstants.REGISTER, map);
  }
}