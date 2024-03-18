import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hidemera/src/firebase/index.dart';

import 'src/app.dart';
import 'src/pages/settings/settings_controller.dart';
import 'src/pages/settings/settings_service.dart';
import 'src/utils/index.dart';

void main() async {
  // 全局错误信息捕捉 1
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    log.e('handing error in global 1:');
    log.e(details);
  };

  // 全局错误信息捕捉 2
  PlatformDispatcher.instance.onError = (error, stack) {
    log.e('handing error in global 2:');
    log.e(error);
    log.e(stack);
    return true;
  };

  // 初始化提前
  WidgetsFlutterBinding.ensureInitialized();
  // 设置哪些系统视图组件需要显示
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    // 只显示顶部状态栏
    overlays: [SystemUiOverlay.top],
  );
  // 设置默认为竖屏
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // 初始化firebase
  await FirebaseHelper.init();
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(
    HidemeraApp(
      settingsController: settingsController
    )
  );
}
