import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/text.dart';

class FormDividerWidget extends StatelessWidget {
  const FormDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Row(
      children: [
        Flexible(child: Divider(thickness: 1, indent: 50, color: Colors.grey.withOpacity(0.3), endIndent: 10)),
        Text(oR, style: Theme.of(context).textTheme.bodyLarge!.apply(color: isDark ? whiteColor.withOpacity(0.5) : darkColor.withOpacity(0.5))),
        Flexible(child: Divider(thickness: 1, indent: 10, color: Colors.grey.withOpacity(0.3), endIndent: 50)),
      ],
    );
  }
}
