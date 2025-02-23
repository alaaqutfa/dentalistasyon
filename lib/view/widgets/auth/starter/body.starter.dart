import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/view/widgets/partials/appBtn.dart';
import 'package:flutter/material.dart';

class StarterBody extends StatelessWidget {
  final Function()? onTapCreate;
  final Function()? onTapLogin;
  final Function()? onTapTermAndPrivacy;
  const StarterBody(
      {super.key, this.onTapCreate, this.onTapLogin, this.onTapTermAndPrivacy});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Themes.bg,
      padding: Themes.edgeMd,
      alignment: Alignment.center,
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImg.appicon),
              Themes.spaceY32,
              Text(
                "Welcome to Dentalistasyon",
                style: Themes.title_xl,
              ),
              Themes.spaceY64,
              btns(context, onTapCreate, onTapLogin),
              Themes.spaceY64,
              defLink(onTapTermAndPrivacy, "Term and Privacy"),
            ],
          ),
        ],
      ),
    ));
  }
}

Widget btns(
    BuildContext context, Function()? onTapCreate, Function()? onTapLogin) {
  return Column(
    children: [
      defBtn(
        MediaQuery.of(context).size.width / 2,
        Themes.primary,
        onTapCreate,
        "Create account",
        true,
      ),
      Themes.spaceY16,
      defBtn(
        MediaQuery.of(context).size.width / 2,
        Themes.lightGray,
        onTapLogin,
        "Login",
        false,
      ),
    ],
  );
}
