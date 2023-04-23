import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_provider.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeMode themeMode = ThemeMode.system;

  @observable
  Brightness platformBrightness = WidgetsBinding.instance.window.platformBrightness;

  @computed
  bool get isLightTheme => platformBrightness == Brightness.light ? true : false;

  @action
  void setTheme(Brightness brightness){
    themeMode = brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
    print('patformBrighness set to $brightness');
    platformBrightness = brightness;
  }

}
