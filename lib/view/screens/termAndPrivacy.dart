import 'package:dentalistasyon/view/widgets/partials/appbar.dart';
import 'package:dentalistasyon/view/widgets/termandprivacy/body.dart';
import 'package:flutter/material.dart';

class TermAndPrivacy extends StatelessWidget {
  const TermAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defAppBar("", false),
      body: TermAndPrivacyBody(),
    );
  }
}
