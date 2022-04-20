import 'package:flutter/material.dart';
import 'package:lampada_frontend/model/leader_model.dart';

import '../../../core/core.dart';

class LeaderItemWidget extends StatefulWidget {
  final Leader leader;

  const LeaderItemWidget({Key? key, required this.leader}) : super(key: key);

  @override
  State<LeaderItemWidget> createState() => _LeaderItemWidgetState();
}

class _LeaderItemWidgetState extends State<LeaderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.white_1,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
