import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class TitledWidget extends StatelessWidget {
  const TitledWidget({
    required this.title,
    required this.child,
    this.action,
    this.showAll,
    this.titleStyle,
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.childPadding = const EdgeInsets.all(0),
  });

  final Widget child;
  final String title;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry titlePadding;
  final EdgeInsetsGeometry childPadding;
  final Widget? action;
  final Function()? showAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: titlePadding,
          child: Row(
            children: [
              Text(title, style: titleStyle??TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Spacer(),
              if (action != null) action!,
              if (showAll != null && action == null)
                InkWell(
                  onTap: showAll,
                  child: Text(
                    "Show All",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: MainThemeColors.primary),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: childPadding,
          child: child,
        ),
      ],
    );
  }
}
