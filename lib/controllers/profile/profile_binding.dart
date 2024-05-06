import 'package:get/get.dart';
import 'package:market3t/controllers/profile/profile_controller.dart';
import 'package:market3t/providers/auth_provider.dart';
import 'package:market3t/providers/user_request_trash_provider.dart';
import 'package:market3t/repositories/auth_reposistory.dart';
import 'package:market3t/repositories/user_request_trash_reponsitory.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController(
        AuthRepository(AuthProvider()),
        UserRequestTrashRepository(UserRequestTrashProvider())));
  }
}
