import 'package:get/get.dart';
import 'package:market3t/controllers/main/request_person/request_person_controller.dart';
import 'package:market3t/providers/user_request_trash_provider.dart';
import 'package:market3t/repositories/user_request_trash_reponsitory.dart';

class RequestPersonBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RequestPersonController>(() 
    => RequestPersonController(UserRequestTrashRepository(UserRequestTrashProvider())));
  }
}