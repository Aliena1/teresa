import 'package:get/get.dart';
import 'package:teresa/repository/profile_view_repository/profile_view_repository.dart';

import '../../models/profile_view_model/profile_view_model.dart';

class ProfileViewController extends GetxController with StateMixin<ProfileViewModel>{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ProfileViewRepository().getProfileView().then((value) => change(value,
    status: RxStatus.success()),onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });


  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}