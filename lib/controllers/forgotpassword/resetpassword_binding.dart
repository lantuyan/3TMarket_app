import 'package:market3t/controllers/forgotpassword/resetpassword_controller.dart';
import 'package:market3t/providers/auth_provider.dart';
import 'package:market3t/repositories/auth_reposistory.dart';
import 'package:get/get.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPassWordController>(
        () => ResetPassWordController(AuthRepository(AuthProvider())));
  }


}
