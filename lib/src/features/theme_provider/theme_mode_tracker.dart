import 'package:bitsgap/src/features/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeModeTracker extends StatefulWidget {
  final Widget child;
  final ThemeStore themeStore;

  ThemeModeTracker({super.key, required this.child, required this.themeStore});

  @override
  _ThemeModeTrackerState createState() => _ThemeModeTrackerState();
}

class _ThemeModeTrackerState extends State<ThemeModeTracker> with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    widget.themeStore.setTheme(brightness);
    print('ThemeTracker: $brightness');
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}