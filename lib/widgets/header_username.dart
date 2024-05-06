import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market3t/controllers/login/login_controller.dart';
import 'package:market3t/controllers/main/infomation/infomation_controller.dart';
import 'package:market3t/providers/infomation_provider.dart';
import 'package:market3t/providers/user_request_trash_provider.dart';
import 'package:market3t/repositories/infomation_reposistory.dart';
import 'package:market3t/repositories/user_request_trash_reponsitory.dart';
import 'package:market3t/shared/themes/style/app_text_styles.dart';
import 'package:market3t/widgets/custom_dialogs.dart';

Padding userName(String name) {
  final InfomationController _homeController = Get.put(InfomationController(
      InfomationReposistory(InfomationProvider())));
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.sp),
    child: Row(
      children: [
        SizedBox(
          width: 0.w,
        ),
        GestureDetector(
          onTap: () {
            // _loginController.logout(); // LOGOUT
            // CustomDialogs.confirmDialog(
            //     'Đăng xuất',
            //     Text(
            //       'Bạn chắc chắn muốn đăng xuất tài khoản',
            //       style: AppTextStyles.bodyText2.copyWith(fontSize: 12.sp),
            //       textAlign: TextAlign.center,
            //     ), () {
            //   _homeController.logOut();
            // });
          },
          child: Image.asset(
            'assets/images/user-avatar.png',
            height: 40.h,
            width: 40.w,
          ),
          
        ),

        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            "Xin chào, " + name,
            style: AppTextStyles.headline1,
            overflow:
                TextOverflow.ellipsis, // Truncate văn bản nếu vượt quá khung
            maxLines: 1, // Giới hạn số dòng hiển thị
          ),
        )
      ],
    ),
  );
}
