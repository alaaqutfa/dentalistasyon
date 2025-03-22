import 'package:dentalistasyon/core/theme/theme.dart';
import 'package:dentalistasyon/core/utils/constant.dart';
import 'package:dentalistasyon/data/model/profile.model.dart';
import 'package:dentalistasyon/view/widgets/partials/appBtn.dart';
import 'package:dentalistasyon/view/widgets/partials/fields.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileBody extends StatelessWidget {
  final String avatar;
  final Function()? onTapAvatar;
  final GlobalKey profileKey;
  final Map<String, RxBool> workingDays;
  final bool notSelectedDays;
  final Function()? onTapWorkingDays;
  final Function()? onTapSave;
  const ProfileBody({
    super.key,
    required this.avatar,
    this.onTapAvatar,
    required this.profileKey,
    required this.workingDays,
    required this.notSelectedDays,
    this.onTapWorkingDays,
    this.onTapSave,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: Themes.edgeMd,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Themes.spaceY16,
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.arrowLeftLong,
                  ),
                ),
                Themes.spaceX8,
                Text(
                  "Profile".tr,
                  style: Themes.title_2xl,
                ),
              ],
            ),
            Themes.spaceY16,
            editAvatar(avatar, onTapAvatar),
            Themes.spaceY16,
            profileForm(
              key: profileKey,
              context: context,
              notSelectedDays: notSelectedDays,
              workingDays: workingDays,
              onTapWorkingDays: onTapWorkingDays,
            ),
            Themes.spaceY16,
            defBtn(double.infinity, Themes.primary, onTapSave, "Save", true),
          ],
        ),
      ),
    );
  }
}

Widget editAvatar(String avatar, Function()? onTapAvatar) {
  return Center(
    child: InkWell(
      onTap: onTapAvatar,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 72,
            backgroundColor: Themes.primary.withOpacity(0.2),
            backgroundImage: AssetImage(
              AppImg.placeholder,
            ),
            foregroundImage: avatar != "" ? NetworkImage(avatar) : null,
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              color: Themes.bg,
              child: Image.asset(
                AppImg.edit_icon,
                height: Spacing.lg,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget profileForm({
  Key? key,
  required BuildContext context,
  required Map<String, RxBool> workingDays,
  required bool notSelectedDays,
  Function()? onTapWorkingDays,
}) {
  return Form(
    key: key,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.sm),
          child: Column(
            children: [
              Themes.spaceY16,
              InputField(
                hasLabel: true,
                labelText: profileFields[0]["label"],
                hintText: profileFields[0]["hint"],
                icon: profileFields[0]["icon"],
                type: profileFields[0]["keyboardType"],
                validator: profileFields[0]["validator"],
                controller: profileFields[0]["controller"],
              ),
              Themes.spaceY16,
              InputField(
                hasLabel: true,
                labelText: profileFields[1]["label"],
                hintText: profileFields[1]["hint"],
                icon: profileFields[1]["icon"],
                type: profileFields[1]["keyboardType"],
                validator: profileFields[1]["validator"],
                controller: profileFields[1]["controller"],
              ),
              Themes.spaceY16,
              InputField(
                hasLabel: true,
                labelText: profileFields[2]["label"],
                hintText: profileFields[2]["hint"],
                icon: profileFields[2]["icon"],
                type: profileFields[2]["keyboardType"],
                validator: profileFields[2]["validator"],
                controller: profileFields[2]["controller"],
              ),
              Themes.spaceY16,
              InputField(
                hasLabel: true,
                labelText: profileFields[3]["label"],
                hintText: profileFields[3]["hint"],
                icon: profileFields[3]["icon"],
                type: profileFields[3]["keyboardType"],
                validator: profileFields[3]["validator"],
                controller: profileFields[3]["controller"],
              ),
              Themes.spaceY16,
              workingDaysWidget(
                context: context,
                workingDays: workingDays,
                notSelectedDays: notSelectedDays,
                onTap: onTapWorkingDays,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget workingDaysWidget({
  required BuildContext context,
  required Map<String, RxBool> workingDays,
  required bool notSelectedDays,
  Function()? onTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Working days".tr,
        style: Themes.title_lg.copyWith(color: Themes.grayText),
      ),
      Themes.spaceY8,
      selectWorkingDaysBtn(
        onTap: onTap,
      ),
      notSelectedDays
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...workingDays.keys.map(
                  (day) {
                    return workingDays[day]!.value
                        ? timeInputs(
                            day: day,
                            context: context,
                          )
                        : Container();
                  },
                ),
              ],
            ),
    ],
  );
}

Widget selectWorkingDaysBtn({
  Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.md,
        vertical: Spacing.sm,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Themes.stroke,
        ),
        borderRadius: Themes.borderRadiusSm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Select".tr,
            style: Themes.text_base.copyWith(color: Themes.grayText),
          ),
          Image.asset(AppImg.select_arrow_icon),
        ],
      ),
    ),
  );
}

Widget timeInputs({required BuildContext context, required String day}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Themes.spaceY16,
      Text(
        day.tr,
        style: Themes.title_lg.copyWith(color: Themes.grayText),
      ),
      Themes.spaceY8,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Work starts at"),
              Themes.spaceY8,
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: InputField(
                  hasLabel: false,
                  hintText: "00:00 pm",
                  type: TextInputType.datetime,
                  icon: "",
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Work ends at"),
              Themes.spaceY8,
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 30,
                child: InputField(
                  hasLabel: false,
                  hintText: "00:00 pm",
                  type: TextInputType.datetime,
                  icon: "",
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
