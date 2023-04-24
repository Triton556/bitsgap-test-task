import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManagerWithSharedPrefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<Result<Map<String, String>>> signIn(String username, String password) async {
    await Future.delayed(Duration(seconds: 1)); // 1 second delay for API request simulation
    final SharedPreferences prefs = await _prefs;
    final String? storedUsername = prefs.getString('username');
    final String? storedPassword = prefs.getString('password');

    if (storedUsername != null && storedPassword != null && storedUsername == username && storedPassword == password) {
      const String authToken = 'dummy_token';
      await prefs.setString('auth_token', authToken);
      return Result.success({'token': authToken, 'login': username});
    } else {
      return Result.error('Username or login is wrong');
    }
  }

  Future<Result<Map<String, String>>> signUp(String username, String password, String email) async {
    await Future.delayed(Duration(seconds: 1)); // 1 second delay for API request simulation
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setString('email', email);

    const String authToken = 'dummy_token';
    await prefs.setString('auth_token', authToken);
    return Result.success({'token': authToken, 'login': username});
  }

  Future<void> signOut() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove('auth_token');
  }

  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.containsKey('auth_token');
  }

  Future<String?> getCurrentUser() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('username');
  }
}

class Result<T> {
  final T? data;
  final String? errorMessage;

  Result._({required this.data, required this.errorMessage});

  factory Result.success(T data) => Result<T>._(data: data, errorMessage: null);

  factory Result.error(String errorMessage) => Result<T>._(data: null, errorMessage: errorMessage);

  bool get isSuccess => data != null;
  bool get isError => errorMessage != null;
}