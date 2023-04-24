import 'package:bitsgap/src/features/authentification/application/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Register the shared_preferences plugin
  SharedPreferences.setMockInitialValues({});

  late AuthStore authStore;
  late BuildContext context;

  setUp(() {
    authStore = AuthStore();
    context = MockBuildContext();
  });

  test('Login with correct credentials', () async {
    // Set the username and password for the test case
    authStore.loginTextController.text = 'test';
    authStore.passwordTextController.text = 'password';

    // Call the login method
    await authStore.login(context);

    // Check if the user is logged in
    expect(authStore.isAuth, true);
  });

  test('Login with incorrect credentials', () async {
    // Set the username and password for the test case
    authStore.loginTextController.text = 'test';
    authStore.passwordTextController.text = 'wrong-password';

    // Call the login method
    await authStore.login(context);

    // Check if the user is not logged in and there's an error message
    expect(authStore.isAuth, false);
    expect(authStore.errorMessage, isNotNull);
  });
}