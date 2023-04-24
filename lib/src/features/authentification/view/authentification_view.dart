import 'package:bitsgap/src/constants/theme_constants.dart';
import 'package:bitsgap/src/features/authentification/application/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../theme_provider/theme_provider.dart';
import 'form_widgets/login_form.dart';
import 'form_widgets/sign_up_form.dart';

class AuthentificationView extends StatefulWidget {
  const AuthentificationView({Key? key}) : super(key: key);

  @override
  State<AuthentificationView> createState() => _AuthentificationViewState();
}

class _AuthentificationViewState extends State<AuthentificationView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _previousTabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void _handleTabTap(BuildContext context) {
    AuthStore _authStore = Provider.of<AuthStore>(context, listen: false);
    print('handleTabSelection');

    if (_tabController.index == _previousTabIndex) {
      if (_tabController.index == 0) {
        print('login');
        _authStore.login(context);
      } else {
        print('signUp');
        _authStore.signUp(context);
      }
    } else {
      _previousTabIndex = _tabController.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeStore themeStore = Provider.of<ThemeStore>(context);
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
            const ErrorMessageWidget(),
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: AuthButtons(
                  handleTabTap: _handleTabTap, tabController: _tabController),
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

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final errorMessage = Provider.of<AuthStore>(context).errorMessage;
      if (errorMessage == null) return const SizedBox.shrink();
      return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          errorMessage,
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      );
    });
  }
}

class AuthButtons extends StatelessWidget {
  final TabController tabController;
  final void Function(BuildContext context) handleTabTap;

  const AuthButtons(
      {Key? key, required this.tabController, required this.handleTabTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _authStore = Provider.of<AuthStore>(context, listen: false);

    return Observer(builder: (context) {
      return IgnorePointer(
        ignoring: _authStore.isAuthProcess,
        child: _authStore.isAuthProcess
            ? const CircularProgressIndicator()
            : TabBar(
                indicator: BoxDecoration(
                  color: _authStore.isAuthProcess
                      ? Theme.of(context).disabledColor
                      : Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                tabs: const [Text('Login'), Text('Sign-up')],
                controller: tabController,
                onTap: (v) => handleTabTap(context),
              ),
      );
    });
  }
}
