import 'package:flutter/material.dart';

import '../../../core/core.dart';

class MenuItemWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const MenuItemWidget({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () => onTap(),
        child: Text(
          label,
          style: AppTextStyles.p_bold_white,
        ),
      ),
    );
  }
}
