import 'package:market3t/controllers/login/login_controller.dart';
import 'package:market3t/providers/auth_provider.dart';
import 'package:market3t/repositories/auth_reposistory.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(AuthRepository(AuthProvider())));
  }
}