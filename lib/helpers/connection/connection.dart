import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionChecker{
  static Future<dynamic> isInternet() async{
    var connectivityResult=await (Connectivity().checkConnectivity());
    if(connectivityResult==ConnectivityResult.mobile){
        return true;
    }
    else if(connectivityResult==ConnectivityResult.wifi){
        return true;
      }
      else{
        return false;
      }
  }
}