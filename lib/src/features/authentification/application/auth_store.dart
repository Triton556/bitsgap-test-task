import 'package:bitsgap/src/features/authentification/data/shared_prefs_auth.dart';
import 'package:bitsgap/src/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final AuthManagerWithSharedPrefs _authManager = AuthManagerWithSharedPrefs();

  @observable
  TextEditingController loginTextController = TextEditingController();
  @observable
  TextEditingController passwordTextController = TextEditingController();
  @observable
  TextEditingController emailTextController = TextEditingController();

  @observable
  String? errorMessage;

  @observable
  bool isAuthProcess = false;

  @observable
  bool _isAuth = false;

  @computed
  bool get isAuth => _isAuth;

  @observable
  String _loggedInUser = '';

  @computed
  String get user => _loggedInUser;

  @action
  Future<void> login(BuildContext context) async {
    isAuthProcess = true;
    errorMessage = null;
    final result = await _authManager.signIn(
      loginTextController.text,
      passwordTextController.text,
    );
    if (result.isSuccess) {
      _loggedInUser = result.data?['login'] ?? '';
      Navigator.pushReplacementNamed(
          context, MainNavigationRouteNames.homeScreen);
    } else {
      errorMessage = result.errorMessage;
    }
    isAuthProcess = false;
  }

  @action
  Future<void> signUp(BuildContext context) async {
    if (loginTextController.text.isEmpty ||
        passwordTextController.text.isEmpty ||
        emailTextController.text.isEmpty) {
      errorMessage = 'Username and password must not be empty!';
      return;
    }
    isAuthProcess = true;
    errorMessage = null;
    final result = await _authManager.signUp(
      loginTextController.text,
      passwordTextController.text,
      emailTextController.text,
    );

    if (result.isSuccess) {
      _loggedInUser = result.data?['login'] ?? '';
      Navigator.pushReplacementNamed(
          context, MainNavigationRouteNames.homeScreen);
    } else {
      errorMessage = result.errorMessage;
    }
    isAuthProcess = false;
  }

  @action
  Future<void> signOut(BuildContext context) async {
    await _authManager.signOut();
    Navigator.pushReplacementNamed(context, MainNavigationRouteNames.auth);
  }

  @action
  Future<void> getCurrentUser() async {
    _loggedInUser = await _authManager.getCurrentUser() ?? '';
  }

  @action
  Future<void> checkAuth() async {
    bool isLoggedIn = await _authManager.isLoggedIn();
    _isAuth = isLoggedIn;
    if (_isAuth) {
      getCurrentUser();
    }
  }
}
