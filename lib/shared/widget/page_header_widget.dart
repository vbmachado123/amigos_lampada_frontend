import 'package:flutter/material.dart';

import '../../core/core.dart';

class PageHeaderWidget extends StatelessWidget {
  final String label;
  final Color color;
  const PageHeaderWidget({Key? key, required this.label, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.h6_bold),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  )),
              height: 10,
              width: 100,
            ),
          ],
        ),
      ],
    );
  }
}
