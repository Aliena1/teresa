import 'package:get/get.dart';

import '../../constants/api_constants/api_constant.dart';
import '../../models/profile_view_model/profile_view_model.dart';

class ProfileViewRepository extends GetConnect{
Future<dynamic> getProfileView() async{
  final response = await get(ApiConstants.BASE_URL+ApiConstants.profileViewApi,headers: {
    'Authorization': '${ApiConstants.TOKEN_TYPE} ${ApiConstants.TOKEN}',
  });

    if(response.status.hasError){
    return Future.error(response.statusText!);
  }
  else{
    // return response.body;
    return ProfileViewModel.fromJson(response.body);
  }
}
}