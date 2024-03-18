import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

/// 初始化firebase
initFirebase () async {
  // 初始化 firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

/// 谷歌统计对象
FirebaseAnalytics analytics = FirebaseAnalytics.instance;
/// 谷歌统计路由监听器
FirebaseAnalyticsObserver analyticsObserver = FirebaseAnalyticsObserver(analytics: analytics);
