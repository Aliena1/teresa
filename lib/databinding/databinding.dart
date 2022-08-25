import 'package:get/get.dart';
import 'package:teresa/controllers/profile_view_controller/profile_view_controller.dart';

class DataBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProfileViewController());
  }

}