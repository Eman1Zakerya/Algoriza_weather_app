import 'package:flutter/material.dart';

import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class DrawerTag extends StatelessWidget {
  final IconData iconData;
  final Icon? prephralIcon;
  final String text;

  const DrawerTag(
      {Key? key, required this.iconData, required this.text, this.prephralIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: getRegularStyle(fontSize: FontSize.s16),
          ),
          const Spacer(),
          if (prephralIcon != null) prephralIcon!
        ],
      ),
    );
  }
}
