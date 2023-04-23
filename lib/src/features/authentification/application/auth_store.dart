import 'package:mobx/mobx.dart';

import '../data/auth_datasource.dart';
import '../domain/user.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final AuthDataSource authDataSource;

  _AuthStore({required this.authDataSource});

  @observable
  User? user;

  @computed
  bool get isLoggedIn => user == null ? false : true;

  @action
  Future<void> signIn(String username, String password) async {
    user = await authDataSource.signIn(username, password);
  }

  @action
  Future<void> signUp(String email, String username, String password) async {
    user = await authDataSource.signUp(email, username, password);
  }

  @action
  Future<void> signOut() async {
    await authDataSource.signOut();
    user = null;
  }

  @action
  Future<void> deleteUser() async {
    if (user != null) {
      await authDataSource.deleteUser(user!.username);
      user = null;
    }
  }

  @action
  Future<void> fetchCurrentUser() async {
    user = await authDataSource.getCurrentUser();
  }
}
