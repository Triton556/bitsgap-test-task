import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const kPrimaryColor = Color(0xff4A55A7);
const kSecondaryColor = Color(0xffBFDBFE);
const kBackgroundColor = Color(0xffF9F9F9);
const kForeground = Color(0xff262931);
const kSuccessColor = Color(0xff00B37E);
const kErrorColor = Color(0xffE12E0D);

const kDarkPrimaryColor = Color(0xff6371DE);
const kDarkSecondaryColor = Color(0xff1E293B);
const kDarkBackgroundColor = Color(0xff181818);
const kDarkForeground = Color(0xffFFFFFF);

class AuthHeadImage extends StatelessWidget {
  const AuthHeadImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/Head.svg',
      fit: BoxFit.fill,
      colorFilter: const ColorFilter.mode(kSecondaryColor, BlendMode.srcIn),
    );
  }
}

class AuthHeadImageDark extends StatelessWidget {
  const AuthHeadImageDark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/Head.svg',
      fit: BoxFit.fill,
      colorFilter: const ColorFilter.mode(kDarkSecondaryColor, BlendMode.srcIn),
    );
  }
}
