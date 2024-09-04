import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:project20/core/db/prefs.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  bool active = false;

  void checkActive() {
    if (controller4.text.length == 10) {
      setState(() {
        active = getButtonActive([
          controller1,
          controller2,
          controller3,
        ]);
      });
    }
  }

  void onSave() async {
    await saveProfile(
      controller1.text,
      controller2.text,
      controller3.text,
      controller4.text,
    ).then((_) {
      context.pop();
    });
  }

  void onBack() {
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    controller1.text = userName;
    controller2.text = userSurname;
    controller3.text = userNickname;
    controller4.text = userBirthday;
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resize: true,
      body: Column(
        children: [
          const CustomAppbar('Profile', profile: true),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              children: [
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    height: 130,
                    width: 130,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/profile.png',
                            height: 120,
                            width: 120,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CupertinoButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            minSize: 20,
                            child: TextB(
                              '+',
                              fontSize: 32,
                              color: AppColors.white40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const TextM(
                  'User',
                  fontSize: 32,
                  center: true,
                ),
                const SizedBox(height: 32),
                TxtField(
                  controller: controller1,
                  hintText: 'First name',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                TxtField(
                  controller: controller2,
                  hintText: 'Last name',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                TxtField(
                  controller: controller3,
                  hintText: 'Nickname',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                TxtField(
                  controller: controller4,
                  hintText: 'Birthday (00.00.0000)',
                  number: true,
                  date: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 86),
                Center(
                  child: PrimaryButton(
                    title: 'Save',
                    active: active,
                    white: !active,
                    width: 190,
                    onPressed: onSave,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: PrimaryButton(
                    title: 'Back',
                    white: !active,
                    width: 190,
                    onPressed: onBack,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
