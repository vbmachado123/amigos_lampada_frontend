import 'package:flutter/material.dart';
import 'package:lampada_frontend/model/leader_model.dart';
import 'package:lampada_frontend/page/list/widget/icon_button_widget.dart';

import '../../../core/core.dart';
import '../../../service/api_service.dart';

class LeaderItemWidget extends StatefulWidget {
  final Leader leader;
  LeaderItemWidget({Key? key, required this.leader}) : super(key: key);

  @override
  State<LeaderItemWidget> createState() => _LeaderItemWidgetState();
}

class _LeaderItemWidgetState extends State<LeaderItemWidget> {
  bool autorizado = false;

  verifyAuthorized() {
    if (widget.leader.authorized == true) {
      autorizado = true;
    }
    setState(() {});
  }

  Future<void> updateUser() async {
    ApiService apiService = ApiService();
    var dto = {
      'id': double.parse(widget.leader.id!),
      'nome': widget.leader.name,
      'email': widget.leader.email,
    };

    var response = apiService.post("colaborador/atualizar", dto);
  }

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
                      widget.leader.name!,
                      style: AppTextStyles.h6_bold_tertiary,
                    ),
                    SizedBox(width: 32),
                    widget.leader.authorized == false
                        ? Text(
                            "Solicitado em: ${DateTime.now()}",
                            style: AppTextStyles.p_regular_primary,
                          )
                        : Container(),
                  ],
                ),
                Text(
                  "CPF: ${widget.leader.cpf}",
                  style: AppTextStyles.p_regular,
                ),
              ],
            ),
            widget.leader.authorized == false
                ? Row(
                    children: [
                      IconButtonWidget(
                        icon: Icons.check,
                        bgColor: AppColors.green_hit,
                        onTap: () => updateUser(),
                      ),
                      IconButtonWidget(
                        icon: Icons.block,
                        bgColor: AppColors.red_error,
                        onTap: () => {},
                      ),
                    ],
                  )
                : Container(),
          ]),
        ),
      ),
    );
  }
}
