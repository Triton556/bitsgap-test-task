import 'package:bitsgap/src/features/authentification/view/authentification_view.dart';
import 'package:bitsgap/src/features/theme_provider/theme_mode_tracker.dart';
import 'package:bitsgap/src/features/theme_provider/theme_provider.dart';
import 'package:bitsgap/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ThemeStore>(
      create: (_) => ThemeStore(),
      child: Consumer<ThemeStore>(builder: (context, themeStore, _) {
        return ThemeModeTracker(
          themeStore: themeStore,
          child: MaterialApp(
            title: 'MobX Dice',
            theme: lightThemeData(context),
            darkTheme: darkThemeData(context),
            themeMode: themeStore.themeMode,
            home: AuthentificationView(),
          ),
        );
      }),
    );
  }
}
