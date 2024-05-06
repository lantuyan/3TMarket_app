import 'package:get/get.dart';
import 'package:market3t/providers/user_provider.dart';
import 'package:market3t/repositories/user_reposistory.dart';

import 'main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(UserRepository(UserProvider())));
  }
}
