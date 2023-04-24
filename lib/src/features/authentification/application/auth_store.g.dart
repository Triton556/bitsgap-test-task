// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  Computed<bool>? _$isAuthComputed;

  @override
  bool get isAuth => (_$isAuthComputed ??=
          Computed<bool>(() => super.isAuth, name: '_AuthStore.isAuth'))
      .value;
  Computed<String>? _$userComputed;

  @override
  String get user => (_$userComputed ??=
          Computed<String>(() => super.user, name: '_AuthStore.user'))
      .value;

  late final _$loginTextControllerAtom =
      Atom(name: '_AuthStore.loginTextController', context: context);

  @override
  TextEditingController get loginTextController {
    _$loginTextControllerAtom.reportRead();
    return super.loginTextController;
  }

  @override
  set loginTextController(TextEditingController value) {
    _$loginTextControllerAtom.reportWrite(value, super.loginTextController, () {
      super.loginTextController = value;
    });
  }

  late final _$passwordTextControllerAtom =
      Atom(name: '_AuthStore.passwordTextController', context: context);

  @override
  TextEditingController get passwordTextController {
    _$passwordTextControllerAtom.reportRead();
    return super.passwordTextController;
  }

  @override
  set passwordTextController(TextEditingController value) {
    _$passwordTextControllerAtom
        .reportWrite(value, super.passwordTextController, () {
      super.passwordTextController = value;
    });
  }

  late final _$emailTextControllerAtom =
      Atom(name: '_AuthStore.emailTextController', context: context);

  @override
  TextEditingController get emailTextController {
    _$emailTextControllerAtom.reportRead();
    return super.emailTextController;
  }

  @override
  set emailTextController(TextEditingController value) {
    _$emailTextControllerAtom.reportWrite(value, super.emailTextController, () {
      super.emailTextController = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_AuthStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$isAuthProcessAtom =
      Atom(name: '_AuthStore.isAuthProcess', context: context);

  @override
  bool get isAuthProcess {
    _$isAuthProcessAtom.reportRead();
    return super.isAuthProcess;
  }

  @override
  set isAuthProcess(bool value) {
    _$isAuthProcessAtom.reportWrite(value, super.isAuthProcess, () {
      super.isAuthProcess = value;
    });
  }

  late final _$_isAuthAtom = Atom(name: '_AuthStore._isAuth', context: context);

  @override
  bool get _isAuth {
    _$_isAuthAtom.reportRead();
    return super._isAuth;
  }

  @override
  set _isAuth(bool value) {
    _$_isAuthAtom.reportWrite(value, super._isAuth, () {
      super._isAuth = value;
    });
  }

  late final _$_loggedInUserAtom =
      Atom(name: '_AuthStore._loggedInUser', context: context);

  @override
  String get _loggedInUser {
    _$_loggedInUserAtom.reportRead();
    return super._loggedInUser;
  }

  @override
  set _loggedInUser(String value) {
    _$_loggedInUserAtom.reportWrite(value, super._loggedInUser, () {
      super._loggedInUser = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthStore.login', context: context);

  @override
  Future<void> login(BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(context));
  }

  late final _$signUpAsyncAction =
      AsyncAction('_AuthStore.signUp', context: context);

  @override
  Future<void> signUp(BuildContext context) {
    return _$signUpAsyncAction.run(() => super.signUp(context));
  }

  late final _$signOutAsyncAction =
      AsyncAction('_AuthStore.signOut', context: context);

  @override
  Future<void> signOut(BuildContext context) {
    return _$signOutAsyncAction.run(() => super.signOut(context));
  }

  late final _$checkAuthAsyncAction =
      AsyncAction('_AuthStore.checkAuth', context: context);

  @override
  Future<void> checkAuth() {
    return _$checkAuthAsyncAction.run(() => super.checkAuth());
  }

  @override
  String toString() {
    return '''
loginTextController: ${loginTextController},
passwordTextController: ${passwordTextController},
emailTextController: ${emailTextController},
errorMessage: ${errorMessage},
isAuthProcess: ${isAuthProcess},
isAuth: ${isAuth},
user: ${user}
    ''';
  }
}
