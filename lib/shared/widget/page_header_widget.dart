import 'package:flutter/material.dart';
import 'package:lampada_frontend/core/app_text_styles.dart';

class PageHeaderWidget extends StatelessWidget {
  final String label;
  final Color color;
  const PageHeaderWidget({Key? key, required this.label, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.h6_bold,
          ),
          Container(
            width: 100,
            height: 12,
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          )
        ],
      ),
    );
  }
}
