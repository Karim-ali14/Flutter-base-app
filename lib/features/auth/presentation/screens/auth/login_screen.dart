import 'package:base_flutter_app/core/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/Constants/Constants.dart';
import '../../../../../core/Theme/app_theme.dart';
import '../../../../../core/localization/Keys.dart';

class LoginScreen extends ConsumerStatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        navigated: true,
        appContext: context,
        title: context.tr(SignInKey),
          trailingWidget: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddingHorizontal),
            child: Text(
            "Arabic",
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts16w400,
            ),
          )),
      body: Text("")
    );
  }

}
