
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:market3t/controllers/main/infomation/infomation_controller.dart';

class InfomationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfomationController>(() => InfomationController());
  }
}
