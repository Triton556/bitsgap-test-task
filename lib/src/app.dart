import 'package:bitsgap/src/features/theme_provider/theme_mode_tracker.dart';
import 'package:bitsgap/src/features/theme_provider/theme_provider.dart';
import 'package:bitsgap/src/navigation.dart';
import 'package:bitsgap/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/authentification/application/auth_store.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _authStore = Provider.of<AuthStore>(context, listen: false);

    return Provider<ThemeStore>(
      create: (_) => ThemeStore(),
      child: Consumer<ThemeStore>(builder: (context, themeStore, _) {
        return ThemeModeTracker(
          themeStore: themeStore,
          child: MaterialApp(
            title: 'Bitsgap',
            theme: lightThemeData(context),
            darkTheme: darkThemeData(context),
            themeMode: themeStore.themeMode,
            routes: mainNavigation.routes,
            initialRoute: mainNavigation.initialRoute(_authStore.isAuth),
          ),
        );
      }),
    );
  }
}
