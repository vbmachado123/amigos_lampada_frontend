import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lampada_frontend/core/app_text_styles.dart';
import 'package:lampada_frontend/core/core.dart';

class ToolbarItemWidget extends StatefulWidget {
  final String label;
  final Widget? page;
  final VoidCallback? onTap;
  final bool isSelected;

  const ToolbarItemWidget(
      {Key? key,
      required this.label,
      this.page,
      required this.isSelected,
      this.onTap})
      : super(key: key);

  @override
  State<ToolbarItemWidget> createState() => _ToolbarItemWidgetState();
}

class _ToolbarItemWidgetState extends State<ToolbarItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.off(widget.page),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style: widget.isSelected
                    ? AppTextStyles.p_bold_white_sublimed
                    : AppTextStyles.p_bold_white,
              ),
            ]),
      ),
    );
  }
}
