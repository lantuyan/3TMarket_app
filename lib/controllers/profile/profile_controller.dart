import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:market3t/managers/data_manager.dart';
import 'package:market3t/repositories/auth_reposistory.dart';
import 'package:market3t/repositories/user_request_trash_reponsitory.dart';
import 'package:market3t/shared/constants/appwrite_constants.dart';
import 'package:market3t/widgets/custom_dialogs.dart';

class ProfileController extends GetxController {
  final AuthRepository _authRepository;
  final UserRequestTrashRepository _requestRepository;

  ProfileController(this._authRepository, this._requestRepository);
  //Get Storage
  final GetStorage _getStorage = GetStorage();
  // district and sub district list
  List<String> districts = [
    "Thành Phố Huế",
    "Hương Thủy",
    "Hương Trà",
    "A Lưới",
    "Nam Đông",
    "Phong Điền",
    "Phú Lộc",
    "Phú Vang",
    "Quảng Điền"
  ];
  Map<String, List<String>> subDistricts = {
    "Thành Phố Huế": [
      "Phường Phú Thuận",
      "Phường Phú Bình",
      "Phường Tây Lộc",
      "Phường Thuận Lộc",
      "Phường Phú Hiệp",
      "Phường Phú Hậu",
      "Phường Thuận Hòa",
      "Phường Thuận Thành",
      "Phường Phú Hòa",
      "Phường Phú Cát",
      "Phường Kim Long",
      "Phường Vĩ Dạ",
      "Phường Phường Đúc",
      "Phường Vĩnh Ninh",
      "Phường Phú Hội",
      "Phường Phú Nhuận",
      "Phường Xuân Phú",
      "Phường Trường An",
      "Phường Phước Vĩnh",
      "Phường An Cựu",
      "Phường An Hòa",
      "Phường Hương Sơ",
      "Phường Thủy Biều",
      "Phường Hương Long",
      "Phường Thủy Xuân",
      "Phường An Đông",
      "Phường An Tây"
    ],
    "Hương Thủy": [
      "Phường Phú Bài",
      "Phường Thúy Dương",
      "Phường Thủy Phương",
      "Phường Thủy Châu",
      "Phường Thủy Lương",
      "Xã Thủy Vân",
      "Xã Thủy Thanh",
      "Xã Thủy Bằng",
      "Xã Thủy Tân",
      "Xã Thủy Phù",
      "Xã Phú Sơn",
      "Xã Dương Hòa"
    ],
    "Hương Trà": [
      "Phường Tứ Hạ",
      "Phường Hương Vân",
      "Phường Hương Văn",
      "Phường Hương Xuân",
      "Phường Hương Chữ",
      "Phường Hương An",
      "Phường Hương Hồ",
      "Xã Hải Dương",
      "Xã Hương Phong",
      "Xã Hương Toàn",
      "Xã Hương Vinh",
      "Xã Hương Bình",
      "Xã Hương Thọ",
      "Xã Bình Tiến",
      "Xã Hồng Tiến",
      "Xã Bình Thành"
    ],
    "A Lưới": [
      "Thị trấn A Lưới",
      "Xã Hồng Vân",
      "Xã Hồng Hạ",
      "Xã Hồng Kim",
      "Xã Trung Sơn",
      "Xã Hương Nguyên",
      "Xã Hồng Bắc",
      "Xã A Ngo",
      "Xã Sơn Thủy",
      "Xã Phú Vinh",
      "Xã Hương Phong",
      "Xã Quảng Nhâm",
      "Xã Hồng Thượng",
      "Xã Hồng Thái",
      "Xã Lâm Đớt",
      "Xã A Roàng",
      "Xã Đông Sơn",
      "Xã Hồng Thủy"
    ],
    "Nam Đông": [
      "Thị trấn Khe Tre",
      "Xã Hương Phú",
      "Xã Hương Sơn",
      "Xã Hương Lộc",
      "Xã Thượng Quảng",
      "Xã Hương Xuân",
      "Xã Hương Hữu",
      "Xã Thượng Lộ",
      "Xã Thượng Long",
      "Xã Thượng Nhật"
    ],
    "Phong Điền": [
      "Thị trấn Phong Điền",
      "Xã Điền Hương",
      "Xã Điền Môn",
      "Xã Điền Lộc",
      "Xã Phong Bình",
      "Xã Điền Hòa",
      "Xã Phong Chương",
      "Xã Phong Hải",
      "Xã Điền Hải",
      "Xã Phong Hòa",
      "Xã Phong Thu",
      "Xã Phong Hiền",
      "Xã Phong Mỹ",
      "Xã Phong An",
      "Xã Phong Xuân",
      "Xã Phong Sơn"
    ],
    "Phú Lộc": [
      "Thị trấn Phú Lộc",
      "Thị trấn Lăng Cô",
      "Xã Vinh Mỹ",
      "Xã Vinh Hưng",
      "Xã Giang Hải",
      "Xã Vinh Hiền",
      "Xã Lộc Bổn",
      "Xã Lộc Sơn",
      "Xã Lộc Bình",
      "Xã Lộc Vĩnh",
      "Xã Lộc An",
      "Xã Lộc Điền",
      "Xã Lộc Thủy",
      "Xã Lộc Trì",
      "Xã Lộc Tiến",
      "Xã Lộc Hòa",
      "Xã Xuân Lộc"
    ],
    "Phú Vang": [
      "Thị trấn Thuận An",
      "Thị trấn Phú Đa",
      "Xã Phú Thuận",
      "Xã Phú Dương",
      "Xã Phú Mậu",
      "Xã Phú An",
      "Xã Phú Hải",
      "Xã Phú Xuân",
      "Xã Phú Diên",
      "Xã Phú Thanh",
      "Xã Phú Mỹ",
      "Xã Phú Thượng",
      "Xã Phú Hồ",
      "Xã Vinh Xuân",
      "Xã Phú Lương",
      "Xã Vinh Thanh",
      "Xã Vinh An",
      "Xã Phú Gia",
      "Xã Vinh Hà"
    ],
    "Quảng Điền": [
      "Thị trấn Sịa",
      "Xã Quảng Thái",
      "Xã Quảng Ngạn",
      "Xã Quảng Lợi",
      "Xã Quảng Công",
      "Xã Quảng Phước",
      "Xã Quảng Vinh",
      "Xã Quảng An",
      "Xã Quảng Thành",
      "Xã Quảng Thọ",
      "Xã Quảng Phú"
    ],
  };

  RxString selectedDistrict = ''.obs;
  RxString selectedSubDistrict = ''.obs;
  // Form Key
    final GlobalKey<FormState> formKey = GlobalKey();
  //Key
  final nameFieldKey = GlobalKey<FormFieldState>();
  final phonenumberFieldKey = GlobalKey<FormFieldState>();
  final zalonumberFieldKey = GlobalKey<FormFieldState>();
  final streetFieldKey = GlobalKey<FormFieldState>();

  final TextEditingController phonenumberController = TextEditingController(
    text: DataManager().getData('phonenumber')
  );
  final TextEditingController zalonumberController = TextEditingController(
    text: DataManager().getData('zalonumber')
  );

  RxString role = ''.obs;
  RxString phonenumber = ''.obs;
  RxString zalonumber = ''.obs;

  var registerType;
  RxBool isLoading = true.obs;

  // chan dung
  
  String imageLink = "";
  RxString imagePath = "".obs;
  late String uid_user;
  RxMap data = {}.obs;
  late File imageFiles;


  @override
  Future<void> onInit() async {
    super.onInit();
    uid_user = await _getStorage.read('uid') ?? await _getStorage.read('userId');
    selectedDistrict.value = districts.first;
    selectedSubDistrict.value = subDistricts[selectedDistrict.value]!.first;
    role.value = await _getStorage.read('role');
    registerType = await _getStorage.read('registerType');
    if (registerType == 'sms') {
      phonenumber.value = await _getStorage.read('phonenumber');
      zalonumber.value = phonenumber.value;
    }
    isLoading.value = false;

    phonenumberController.addListener(() {
      if (zalonumber.value.isEmpty) {
        zalonumberController.text = phonenumberController.text;
      }
    });
  }

  @override
  void onClose() {
    phonenumberController.dispose();
    zalonumberController.dispose();
    super.onClose();
  }

  Future<void> uploadImageToAppwrite(File imageFile) async {
    CustomDialogs.showLoadingDialog();
    imagePath.value = imageFile.path;
    imageFiles = File(imageFile.path);
    
    try {
      // Add the 'await' keyword to wait for the upload to complete
      var value =
          await _requestRepository.uploadImageToAppwrite(imagePath.value);

      imageLink = 'https://cloud.appwrite.io/v1/storage/' +
          'buckets/${AppWriteConstants.userRequestTrashBucketId}/' +
          'files/${value.$id}/view?project=${AppWriteConstants.projectId}';

      CustomDialogs.hideLoadingDialog();
    } catch (onError) {
      CustomDialogs.hideLoadingDialog();
      print(onError);
    }
  }

  Future<void> sendImageToAppwrite(String uid_user) async {
    CustomDialogs.showLoadingDialog();
    // await uploadImageToAppwrite();
    String pathPhoto = imageLink;
    await _requestRepository
        .updateAvatarCollector(uid_user, pathPhoto)
        .then((value) {
      CustomDialogs.hideLoadingDialog();
      // Get.offNamed('/mainPage');

      CustomDialogs.showSnackBar(2, "Gửi thành công", 'success');
    }).catchError((onError) {
      CustomDialogs.hideLoadingDialog();
      print(onError);
      CustomDialogs.showSnackBar(
          2, "Đã có lỗi xảy ra vui lòng thử lại sau!", 'error');
    });
  }

  Future<void> updateProfile() async {
    CustomDialogs.showLoadingDialog();
    // sendImageToAppwrite(uid_user);
    Map<String, dynamic> formValue = {
      "name" : nameFieldKey.currentState!.value,
      "phonenumber" : phonenumberFieldKey.currentState!.value,
      "zalonumber" : zalonumberFieldKey.currentState!.value,
      "street" : streetFieldKey.currentState!.value,
    };

    print("formValue: $formValue");

    String address = formValue['street'] +","+selectedDistrict.value+","+selectedSubDistrict.value;
    final userId = await _getStorage.read('userId');
    if(await _authRepository.checkUserExist(formValue['phonenumber']) && registerType != 'sms') {
        CustomDialogs.hideLoadingDialog();
        CustomDialogs.showSnackBar(2,"Số điện thoại đã tồn tại, hãy thử lại với số khác", 'error');
    } else{
        await _authRepository.updateProfile(formValue, address, userId,imageLink ).then((value) async {
        await _getStorage.write('name', formValue['name']);
        await _getStorage.write('phonenumber', formValue['phonenumber']);
        await _getStorage.write('zalonumber', formValue['zalonumber']);
        await _getStorage.write('address', address);
        await _getStorage.write('avatar', imageLink);

        DataManager().saveData('userId', userId);
        DataManager().saveData('name', formValue['name']);
        DataManager().saveData('role', await _getStorage.read('role'));
        DataManager().saveData('zalonumber', formValue['zalonumber']);
        DataManager().saveData('phonenumber', formValue['phonenumber']);
        DataManager().saveData('address', address);
        DataManager().saveData('avatar', imageLink);
        
        CustomDialogs.hideLoadingDialog();
        Get.offAllNamed('/mainPage');
        }).catchError((onError){
          print(onError); 
          CustomDialogs.hideLoadingDialog();
          CustomDialogs.showSnackBar(2, "Đã có lỗi xảy ra vui lòng thử lại sau!", 'error');
        });
    }
  }
}
