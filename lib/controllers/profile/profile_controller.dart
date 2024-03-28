import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:market3t/repositories/auth_reposistory.dart';
import 'package:market3t/widgets/custom_dialogs.dart';

class ProfileController extends GetxController {
  final AuthRepository _authRepository;

  ProfileController(this._authRepository);
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
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  //Key
  final nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final phonenumberFieldKey = GlobalKey<FormBuilderFieldState>();
  final zalonumberFieldKey = GlobalKey<FormBuilderFieldState>();
  final streetFieldKey = GlobalKey<FormBuilderFieldState>();
  @override
  void onInit() {
    super.onInit();
    selectedDistrict.value = districts.first;
    selectedSubDistrict.value = subDistricts[selectedDistrict.value]!.first;

  }



  Future<void> updateProfile(Map formValue) async {
    CustomDialogs.showLoadingDialog();
    String address = formValue['street'] +","+selectedDistrict.value+","+selectedSubDistrict.value;
    final userId = await _getStorage.read('userId');
    await _authRepository.updateProfile(formValue, address, userId).then((value) async {
      await _getStorage.write('name', formValue['name']);
      await _getStorage.write('phonenumber', formValue['phonenumber']);
      await _getStorage.write('zalonumber', formValue['zalonumber']);
      await _getStorage.write('address', address);
      CustomDialogs.hideLoadingDialog();
      Get.offAllNamed('/mainPage');
    }).catchError((onError){
      print(onError); 
      CustomDialogs.hideLoadingDialog();
      CustomDialogs.showSnackBar(2, "Đã có lỗi xảy ra vui lòng thử lại sau!", 'error');
    });
  }
}
