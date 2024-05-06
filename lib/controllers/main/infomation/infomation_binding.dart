import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:market3t/controllers/main/infomation/infomation_controller.dart';

import 'package:market3t/providers/user_request_trash_provider.dart';
import 'package:market3t/repositories/user_request_trash_reponsitory.dart';

import 'package:market3t/providers/infomation_provider.dart';
import 'package:market3t/repositories/infomation_reposistory.dart';


class InfomationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfomationController>(() => InfomationController(InfomationReposistory(InfomationProvider())));

  }
}
