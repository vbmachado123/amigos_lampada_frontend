import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';

class ToolbarWidget extends StatefulWidget {
  const ToolbarWidget({Key? key}) : super(key: key);

  @override
  State<ToolbarWidget> createState() => _ToolbarWidgetState();
}

class _ToolbarWidgetState extends State<ToolbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 12,
      ),
      width: double.maxFinite,
      height: 72,
      decoration: BoxDecoration(
        color: AppColors.tertiary0,
        boxShadow: [
          AppShadows.shadow0,
          AppShadows.shadow0,
        ],
      ),
      child: Row(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/amigos_lampada_logo.svg",
                height: 64,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Amigos da Lâmpada",
                  style: AppTextStyles.h6_bold_white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
