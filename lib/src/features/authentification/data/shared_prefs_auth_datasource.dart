import 'dart:convert';

import 'package:bitsgap/src/features/authentification/data/auth_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/user.dart';

class SharedPreferencesAuthDataSource implements AuthDataSource {
  final SharedPreferences sharedPreferences;

  const SharedPreferencesAuthDataSource({
    required this.sharedPreferences,
  });

  @override
  Future<User> signIn(String username, String password) async {
    bool registered = await isUserRegistered(username);
    if (!registered) {
      throw Exception('Пользователь с таким именем не зарегестрирован');
    }

    User? findedUser;
    getUser(username)
        .then((value) => {
              if (value?.password == password)
                {
                  findedUser = value,
                }
            })
        .catchError((error) => {
              throw Exception(error),
            });

    if (findedUser != null) {
      return findedUser!;
    }
    throw Exception('Неверный пароль');
  }

  @override
  Future<void> deleteUser(String username) async {
    await sharedPreferences.remove(username);
  }

  @override
  Future<User?> getCurrentUser() async {
    final userData = sharedPreferences.getString('user');
    if (userData == null) return null;
    return User.fromJson(jsonDecode(userData));
  }

  @override
  Future<void> saveCurrentUser(User user) async {
    final userData = jsonEncode(user);
    await sharedPreferences.setString('user', userData);
  }

  @override
  Future<User> signUp(String email, String username, String password) async {
    bool registered = await isUserRegistered(username);
    if (registered) {
      throw Exception('Пользователь с таким именем уже зарегестрирован');
    }

    final User user =
        User(email: email, username: username, password: password);

    await sharedPreferences.setString(username, jsonEncode(user));
    saveCurrentUser(user);
    return user;
  }

  @override
  Future<bool> isUserRegistered(String username) async {
    final userData = await sharedPreferences.getString(username);
    if (userData == null) return false;
    return true;
  }

  @override
  Future<void> signOut() async {
    await sharedPreferences.remove('user');
  }

  @override
  Future<User?> getUser(String username) async {
    final userData = await sharedPreferences.getString(username);
    if (userData == null) throw Exception('Пользователь не найден');
    return User.fromJson(jsonDecode(userData));
  }
}
