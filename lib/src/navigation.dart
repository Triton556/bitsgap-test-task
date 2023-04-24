import 'package:flutter/cupertino.dart';

import 'features/authentification/view/authentification_view.dart';
import 'features/home_page/view/home_page.dart';

class MainNavigationRouteNames {
  static const auth = 'auth';
  static const homeScreen = '/';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNames.homeScreen
      : MainNavigationRouteNames.auth;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => AuthentificationView(),
    MainNavigationRouteNames.homeScreen: (context) => HomePage(),
  };
}
