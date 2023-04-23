import '../domain/user.dart';

abstract class AuthDataSource {
  Future<User> signIn(String username, String password);

  Future<User> signUp(String email, String username, String password);

  Future<bool> isUserRegistered(String username);

  Future<void> saveCurrentUser(User user);

  Future<User?> getUser(String username);

  Future<void> signOut();

  Future<User?> getCurrentUser();

  Future<void> deleteUser(String username);
}
