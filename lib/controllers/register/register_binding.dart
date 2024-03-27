import 'package:market3t/controllers/register/register_controller.dart';
import 'package:market3t/providers/auth_provider.dart';
import 'package:market3t/repositories/auth_reposistory.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => 
                RegisterController(AuthRepository(AuthProvider())));
  }
}