import 'package:get/get_connect/connect.dart';

import '../../constants/api_constants/api_constant.dart';
import 'package:teresa/services/remote_services/remote_services.dart';

class DeclineAvailableJobRepo extends GetConnect {
  Future<dynamic> declineJob(String jobId) async {
    var map = {
      "jobId": jobId
    };
    return await RemoteServices.postMethod(ApiConstants.declineAvailableJobs, map);
  }
//
//     String apiUrl = ApiConstants.BASE_URL + ApiConstants.profileViewApi;
//     var body = {
//       'jobId': jobId,
//     };
//
//     final response = await post(
//       apiUrl,
//       body,
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         "Accept": "application/json"
//       },
//     );
//     // print('response: ${response.body}');
//     // if (response.statusCode == 200) {
//     //   return TicketReply.fromJson(response.body);
//     // } else {
//     //   return Future.error(response.statusText!);
//     // }
//
//     if(response.status.hasError){
//       return Future.error(response.statusText!);
//     }
//     else{
//       return response.body;
//     }
//   }
// }
}