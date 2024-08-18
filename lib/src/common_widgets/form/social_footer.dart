import 'package:event_planning2/src/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/image.dart';
import '../../constants/size.dart';
import '../../constants/text.dart';
import '../../features/authentication/controllers/login_controller.dart';
import '../buttons/clickable_richtext_widget.dart';
import '../buttons/social_button.dart';

class SocialFooter extends StatelessWidget {
  const SocialFooter({
    Key? key,
    this.text1 = dontHaveAnAccount,
    this.text2 = cSignup,
    required this.onPressed,
  }) : super(key: key);

  final String text1, text2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Container(
      padding: const EdgeInsets.only(top: defaultSize * 1.5, bottom: defaultSize),
      child: Column(
        children: [
          Obx(
                () => SocialButton(
              image: googleLogo,
              background: googleBgColor,
              foreground: googleForegroundColor,
              text: '${connectWith.tr} ${google.tr}',
              isLoading: controller.isGoogleLoading.value ? true : false,
              onPressed: controller.isFacebookLoading.value || controller.isLoading.value
                  ? () {}
                  : controller.isGoogleLoading.value
                  ? () {}
                  : () => controller.googleSignIn(),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
                () => SocialButton(
              image: facebookLogo,
              foreground: whiteColor,
              background: facebookBgColor,
              text: '${connectWith.tr} ${facebook.tr}',
              isLoading: controller.isFacebookLoading.value ? true : false,
              onPressed: controller.isGoogleLoading.value || controller.isLoading.value
                  ? () {}
                  : controller.isFacebookLoading.value
                  ? () {}
                  : () => controller.facebookSignIn(),
            ),
          ),
          const SizedBox(height: defaultSize * 2),
          ClickableRichTextWidget(
            text1: text1.tr,
            text2: text2.tr,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
