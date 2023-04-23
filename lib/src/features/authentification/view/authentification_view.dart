import 'package:bitsgap/src/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../theme_provider/theme_provider.dart';

class AuthentificationView extends StatelessWidget {
  const AuthentificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeStore themeStore = Provider.of<ThemeStore>(context);

    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
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
            Container(
              child: Column(
                children: [
                  Form(
                    child: TextField(
                      decoration: InputDecoration(),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
