import 'package:bitsgap/src/constants/text_theme_constants.dart';
import 'package:bitsgap/src/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../theme_provider/theme_provider.dart';

class AuthentificationView extends StatefulWidget {
  const AuthentificationView({Key? key}) : super(key: key);

  @override
  State<AuthentificationView> createState() => _AuthentificationViewState();
}

class _AuthentificationViewState extends State<AuthentificationView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ThemeStore themeStore = Provider.of<ThemeStore>(context);
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Header(themeStore: themeStore),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: LoginForm(),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: SignInForm(),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                tabs: [Text('Login'), Text('Sign-up')],
                controller: _tabController,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 42),
              child: TextButton(
                child: Text('Forgot Password?'),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              AuthFormField(hint: 'Email'),
              SizedBox(height: 12),
              AuthFormField(hint: 'Username'),
              SizedBox(height: 12),
              AuthFormField(hint: 'Password'),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              AuthFormField(hint: 'Username'),
              SizedBox(height: 12),
              AuthFormField(hint: 'Password'),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthFormField extends StatelessWidget {
  final String? hint;

  const AuthFormField({super.key, this.hint = ''});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 46),
        hintText: hint,
        hintStyle: ttNormsProTextTheme.labelMedium,
      ),
      textAlignVertical: TextAlignVertical.bottom,
    );
  }
}

class _Header extends StatelessWidget {
  final ThemeStore themeStore;

  const _Header({Key? key, required this.themeStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Observer(builder: (context) {
            Widget headWidget =
                themeStore.platformBrightness == Brightness.light
                    ? const AuthHeadImage()
                    : const AuthHeadImageDark();
            return headWidget;
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 54),
          child: SvgPicture.asset(
            'assets/svg/Logo.svg',
          ),
        ),
      ],
    );
  }
}
