import 'package:get/get.dart';
import 'package:market3t/controllers/main/home/home_controller.dart';
import 'package:market3t/controllers/main/process_collector/collector_detail_process_controller.dart';
import 'package:market3t/controllers/main/request_detail/request_detail_controller.dart';
import 'package:market3t/controllers/main/request_person/request_person_controller.dart';
import 'package:market3t/providers/category_provider.dart';
import 'package:market3t/providers/user_request_trash_provider.dart';
import 'package:market3t/repositories/category_reponsitory.dart';
import 'package:market3t/repositories/user_request_trash_reponsitory.dart';

class CollectorDetailProcessBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CollectorDetailProcessController>(() 
    => CollectorDetailProcessController(UserRequestTrashRepository(UserRequestTrashProvider())));
  }
}