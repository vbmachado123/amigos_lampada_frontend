import 'package:lampada_frontend/core/core.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool enabled;
  final double height;
  ButtonWidget(
      {Key? key,
      required this.label,
      required this.onTap,
      required this.enabled})
      : this.height = 64,
        super(key: key);

  ButtonWidget.dynamic(
      {Key? key,
      required this.label,
      required this.onTap,
      required this.height,
      required this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Opacity(
        opacity: enabled ? 1 : 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
              color: AppColors.primary0,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [AppShadows.light_yellow]),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.h6_bold_white,
            ),
          ),
        ),
      ),
    );
  }
}
