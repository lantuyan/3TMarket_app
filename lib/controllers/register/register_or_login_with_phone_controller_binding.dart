import 'package:market3t/controllers/register/register_controller.dart';
import 'package:market3t/controllers/register/register_or_login_with_phone_controller.dart';
import 'package:market3t/providers/auth_provider.dart';
import 'package:market3t/repositories/auth_reposistory.dart';
import 'package:get/get.dart';

class RegisterOrLoginWithPhoneBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterOrLoginWithPhoneController>(() =>
        RegisterOrLoginWithPhoneController(AuthRepository(AuthProvider())));
  }
}