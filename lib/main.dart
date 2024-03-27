import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market3t/app_binding.dart';
import 'package:market3t/controllers/theme/themes_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:market3t/routes/routes.dart';
import 'package:market3t/shared/themes/Themes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:market3t/shared/translations/localization_service.dart';

void main() async {
  await GetStorage.init();

  runApp(App());
}

class App extends StatelessWidget {
  final ThemesController themeController = Get.put(ThemesController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return SafeArea(
          child: GetMaterialApp(
            defaultTransition: Transition.noTransition,
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            title: '3TMarket',
            // theme: Themes.lightTheme,
            // darkTheme: Themes.darkTheme,
            // themeMode: getThemeMode(themeController.theme),
            locale: LocalizationService.locale,
            fallbackLocale: LocalizationService.fallbackLocale,
            translations: LocalizationService(),
            getPages: Routes.routes,
            initialRoute: Routes.INITIAL,
            initialBinding: AppBinding(),
          ),
        );
      },
    );
  }

  ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case "system":
        themeMode = ThemeMode.system;
        break;
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }
    return themeMode;
  }
}
