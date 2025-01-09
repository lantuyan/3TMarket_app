import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:market3t/managers/data_manager.dart';

import 'package:market3t/providers/auth_provider.dart';

import 'package:market3t/models/infomation/setting_infomation.dart';
import 'package:market3t/repositories/infomation_reposistory.dart';
import 'package:market3t/repositories/user_reposistory.dart';
import 'package:market3t/widgets/custom_dialogs.dart';

class InfomationController extends GetxController {
  final GetStorage _getStorage = GetStorage();
  final InfomationReposistory _infomationReposistory;
  final UserRepository _userRepository;

  InfomationController(this._infomationReposistory, this._userRepository);

  late SettingInformation mainSettingInfommation;
  List<SettingInformation> settingList = [];

  @override
  Future<void> onInit() async {
    print("mainSettingInfommation oninit");
    getSettingInfomation();
    super.onInit();
  }

  Future<void> getSettingInfomation() async {
    try {
      await _infomationReposistory.getInfomationSetting().then((value) {
        print('value $value');
        Map<String, dynamic> data = value.toMap();
        List documents = data['documents'].toList();
        settingList = documents.map((e) => SettingInformation.fromMap(e['data'])).toList();
        print('settingList $settingList');
      });
    } catch (e) {
      print("settingList false ${e}");
      print(e);
    }
  }

  Future<void> logOut() async {
    CustomDialogs.showLoadingDialog();
    try {
      await AuthProvider().logOut(_getStorage.read('sessionId')).then((value) {
        CustomDialogs.hideLoadingDialog();
        _getStorage.remove('userId');
        _getStorage.remove('sessionId');
        _getStorage.remove('name');
        _getStorage.remove('role');
        _getStorage.remove('zalonumber');
        _getStorage.remove('address');
        DataManager().clearData();
        Get.offAllNamed('/landingPage');
      }).catchError((onError) {
        print("Error: $onError");
        CustomDialogs.hideLoadingDialog();
        CustomDialogs.showSnackBar(2, "Đã có lỗi xảy ra vui lòng thử lại sau!", 'error');
        DataManager().clearData();
        Get.offAllNamed('/landingPage');
      });
    } catch (error) {
      print("Error: $error");
      CustomDialogs.hideLoadingDialog();
      CustomDialogs.showSnackBar(2, "Đã có lỗi xảy ra vui lòng thử lại sau!", 'error');
      DataManager().clearData();
      Get.offAllNamed('/landingPage');
    }
  }

  Future<void> deleteAccount() async {
    String uuid = _getStorage.read('userId');
    CustomDialogs.showLoadingDialog();
    try {
      await _userRepository.deleteUser(uuid).then((value) {
        _getStorage.remove('userId');
        _getStorage.remove('sessionId');
        _getStorage.remove('name');
        _getStorage.remove('role');
        _getStorage.remove('zalonumber');
        _getStorage.remove('address');

        DataManager().clearData();
        CustomDialogs.hideLoadingDialog();
        Get.offAllNamed('/landingPage');
        CustomDialogs.showSnackBar(2, "Xóa tài khoản thành công", 'success');
      });
    } catch (e) {
      print(e);
      CustomDialogs.hideLoadingDialog();
      CustomDialogs.showSnackBar(2, "Đã có lỗi xảy ra vui lòng thử lại sau!", 'error');
    }
  }
}
