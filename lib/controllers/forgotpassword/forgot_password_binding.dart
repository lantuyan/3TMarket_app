import 'package:market3t/controllers/forgotpassword/forgot_password_controller.dart';
import 'package:market3t/providers/auth_provider.dart';
import 'package:market3t/repositories/auth_reposistory.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
        () => ForgotPasswordController(AuthRepository(AuthProvider())));
  }
}
