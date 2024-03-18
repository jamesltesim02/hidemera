import 'package:flutter/material.dart';
import 'package:hidemera/src/firebase/index.dart';
import 'package:hidemera/src/pages/unknow_page.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';

// import 'settings/settings_view.dart';

Map<String, Widget> pages = {
  // SettingsView.routeName: SettingsView(),
  SampleItemDetailsView.routeName: const SampleItemDetailsView(),
  SampleItemListView.routeName: const SampleItemListView(),
};

Route generateRoute (RouteSettings routeSettings) {
  FirebaseHelper.analytics.logScreenView(screenName: routeSettings.name);
  return MaterialPageRoute<void>(
    settings: routeSettings,
    builder: (BuildContext context) {
      return (
        pages[routeSettings.name]
        ??
        UnknowPage(pageName: routeSettings.name ?? '')
      );
    },
  );
}
