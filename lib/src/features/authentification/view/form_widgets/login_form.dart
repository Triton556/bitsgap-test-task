import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../application/auth_store.dart';
import 'auth_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthStore authStore = Provider.of<AuthStore>(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(top: 92, bottom: 30),
        child: SizedBox(
          height: 162,
          width: 342,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 56),
              Observer(
                builder: (context) {
                  return AuthFormField(hint: 'Username', controller: authStore.loginTextController);
                }
              ),
              SizedBox(height: 12),
              Observer(
                builder: (context) {
                  return AuthFormField(hint: 'Password', controller: authStore.passwordTextController,);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}