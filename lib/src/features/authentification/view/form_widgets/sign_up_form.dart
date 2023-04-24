import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../application/auth_store.dart';
import 'auth_form_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
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
              Observer(builder: (context) {
                return AuthFormField(
                  hint: 'Email',
                  onChanged: (v) {},
                  controller: authStore.emailTextController,
                );
              }),
              const SizedBox(height: 12),
              Observer(builder: (context) {
                return AuthFormField(
                  hint: 'Username',
                  onChanged: (v) {},
                  controller: authStore.loginTextController,
                );
              }),
              const SizedBox(height: 12),
              Observer(builder: (context) {
                return AuthFormField(
                  hint: 'Password',
                  onChanged: (value) {},
                  controller: authStore.passwordTextController,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
