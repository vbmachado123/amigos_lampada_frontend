import 'package:flutter/material.dart';

import '../../../core/core.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final VoidCallback onTap;
  const IconButtonWidget(
      {Key? key,
      required this.icon,
      required this.bgColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 54,
        height: 54,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            boxShadow: [
              AppShadows.shadow0,
            ]),
        child: Icon(
          icon,
          color: AppColors.white0,
          size: 32,
        ),
      ),
    );
  }
}
