import 'package:flutter/material.dart';
import 'package:lampada_frontend/core/app_text_styles.dart';

class ToolbarWidget extends StatefulWidget {
  final String label;
  final Widget? page;
  final bool isSelected;

  const ToolbarWidget(
      {Key? key, required this.label, this.page, required this.isSelected})
      : super(key: key);

  @override
  State<ToolbarWidget> createState() => _ToolbarWidgetState();
}

class _ToolbarWidgetState extends State<ToolbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          widget.label,
          style: AppTextStyles.h5_bold_white,
        )
      ]),
    );
  }
}
