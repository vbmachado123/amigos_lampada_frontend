import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lampada_frontend/model/leader_model.dart';
import 'package:lampada_frontend/page/list/widget/icon_button_widget.dart';

import '../../../core/core.dart';
import '../../../service/api_service.dart';
import '../../../shared/widget/alert_dialog_widget.dart';
import 'package:lampada_frontend/shared/widget/button_widget.dart';

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
    print("id: ${widget.leader.id}");
    print("Nome: ${widget.leader.name}");
    print("Email: ${widget.leader.email}");
    var dto = {
      "nome": widget.leader.name,
      "cpf": widget.leader.cpf,
      "email": widget.leader.email,
      "id": 3
    };

    var response = await apiService.put("colaborador/atualizar", dto);
  }

  void openDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialogWidget(
              title: "Detalhes do Eleitor: ${widget.leader.id}",
              currentBody: Container(
                // height: 250,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: AppColors.white1,
                              boxShadow: [
                                AppShadows.shadow0,
                                AppShadows.shadow0,
                                AppShadows.shadow_hover,
                              ]),
                          child: Image.asset(
                            "assets/mentore.png",
                            width: 150,
                            height: 150,
                          ),
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nome: ${widget.leader.name}",
                              style: AppTextStyles.h6_regular,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "E-mail: ${widget.leader.email ?? '01 - 01 - 1900'}",
                              style: AppTextStyles.h6_regular,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "CPF: ${widget.leader.cpf}",
                              style: AppTextStyles.h6_regular,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Rua: ${widget.leader.address!.address ?? 'Não informado'}",
                                  style: AppTextStyles.p_regular,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  width: 32,
                                ),
                                Text(
                                  "Bairro: ${widget.leader.address!.district ?? 'Não informado'}",
                                  style: AppTextStyles.p_regular,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Complemento: ${widget.leader.address!.complement ?? '---'}",
                                  style: AppTextStyles.p_regular,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  width: 32,
                                ),
                                Text(
                                  "CEP: ${widget.leader.address!.cep ?? 'Não informado'}",
                                  style: AppTextStyles.p_regular,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 250,
                          child: ButtonWidget(
                              label: "Alguma função",
                              onTap: () => {
                                    updateUser(),
                                    print("Alguma função"),
                                  },
                              enabled: true),
                        ),
                        Container(
                          width: 250,
                          child: ButtonWidget(
                            label: "Enviar Mensagem ",
                            onTap: () => {
                              js.context.callMethod('open', [
                                'https://api.whatsapp.com/send?phone=55${widget.leader.phone}',
                              ]),
                              print("Enviar Mensagem no Whatsapp"),
                            },
                            enabled: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    Container(
                      width: Get.size.width,
                      height: 2,
                      color: AppColors.primary0,
                    ),
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () => openDialog(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          width: double.maxFinite,
          height: 86,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        onTap: () async => await updateUser(),
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
