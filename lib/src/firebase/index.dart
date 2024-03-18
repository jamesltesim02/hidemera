import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

class FirebaseHelper {
    /// 谷歌统计对象
  static late FirebaseAnalytics analytics;
    /// 谷歌统计路由监听器
  static late FirebaseAnalyticsObserver analyticsObserver;

  /// 初始化firebase
  static Future<void> init () async {
    print('the apiKey is: ${DefaultFirebaseOptions.currentPlatform.apiKey}');

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    /// 谷歌统计对象
    analytics = FirebaseAnalytics.instance;
    /// 谷歌统计路由监听器
    analyticsObserver = FirebaseAnalyticsObserver(analytics: analytics);

  }
}
