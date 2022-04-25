import 'package:flutter/material.dart';
import 'package:lampada_frontend/model/leader_model.dart';
import 'package:lampada_frontend/model/voter_model.dart';
import 'package:lampada_frontend/page/list/widget/icon_button_widget.dart';

import '../../../core/core.dart';
import '../../../service/api_service.dart';

class VoterItemWidget extends StatefulWidget {
  final Voter voter;
  VoterItemWidget({Key? key, required this.voter}) : super(key: key);

  @override
  State<VoterItemWidget> createState() => _VoterItemWidgetState();
}

class _VoterItemWidgetState extends State<VoterItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          width: double.maxFinite,
          // height: 72,
          decoration: BoxDecoration(
            color: AppColors.white_1,
            borderRadius: BorderRadius.all(Radius.circular(32)),
            boxShadow: [
              AppShadows.shadow0,
              AppShadows.shadow0,
            ],
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.voter.name!,
                      style: AppTextStyles.h6_bold_tertiary,
                    ),
                    SizedBox(width: 32),
                    Text(
                      widget.voter.phone,
                      style: AppTextStyles.p_regular_primary,
                    )
                  ],
                ),
                Text(
                  "Apelido: ${widget.voter.surname}",
                  style: AppTextStyles.p_regular,
                ),
              ],
            ),
            // widget.voter. == false
            //     ? Row(
            //         children: [
            //           IconButtonWidget(
            //             icon: Icons.check,
            //             bgColor: AppColors.green_hit,
            //             onTap: () => updateUser(),
            //           ),
            //           IconButtonWidget(
            //             icon: Icons.block,
            //             bgColor: AppColors.red_error,
            //             onTap: () => {},
            //           ),
            //         ],
            //       )
            //     : Container(),
          ]),
        ),
      ),
    );
  }
}
