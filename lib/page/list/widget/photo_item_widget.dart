import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lampada_frontend/model/leader_model.dart';
import 'package:lampada_frontend/model/voter_model.dart';
import 'package:lampada_frontend/page/list/widget/icon_button_widget.dart';
import 'package:lampada_frontend/shared/widget/button_widget.dart';

import '../../../core/core.dart';
import '../../../model/photo_model.dart';
import '../../../service/api_service.dart';
import '../../../shared/widget/alert_dialog_widget.dart';

class PhotoItemWidget extends StatefulWidget {
  final Photo photo;
  PhotoItemWidget({Key? key, required this.photo}) : super(key: key);

  @override
  State<PhotoItemWidget> createState() => _PhotoItemWidgetState();
}

class _PhotoItemWidgetState extends State<PhotoItemWidget> {
  void openDialog() {
    // showDialog(
    //     context: context,
    //     barrierDismissible: true,
    //     builder: (BuildContext context) {
    //       return AlertDialogWidget(
    //           title: "Detalhes do Eleitor: ${widget.voter.id}",
    //           currentBody: Container(
    //             // height: 250,
    //             padding: const EdgeInsets.all(16),
    //             child: Column(
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: [
    //                     Container(
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(32),
    //                           color: AppColors.white1,
    //                           boxShadow: [
    //                             AppShadows.shadow0,
    //                             AppShadows.shadow0,
    //                             AppShadows.shadow_hover,
    //                           ]),
    //                       child: Image.asset(
    //                         "assets/mentore.png",
    //                         width: 150,
    //                         height: 150,
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       width: 32,
    //                     ),
    //                     Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Nome: ${widget.voter.name}",
    //                           style: AppTextStyles.h6_regular_secondary,
    //                           overflow: TextOverflow.ellipsis,
    //                         ),
    //                         Text(
    //                           "Apelido: ${widget.voter.surname}",
    //                           style: AppTextStyles.h6_regular,
    //                           overflow: TextOverflow.ellipsis,
    //                         ),
    //                         Text(
    //                           "Nascimento: ${widget.voter.birthday ?? '01 - 01 - 1900'}",
    //                           style: AppTextStyles.h6_regular,
    //                           overflow: TextOverflow.ellipsis,
    //                         ),
    //                         Text(
    //                           "Telefone: ${widget.voter.phone}",
    //                           style: AppTextStyles.h6_regular_primary,
    //                           overflow: TextOverflow.ellipsis,
    //                         ),
    //                       ],
    //                     ),
    //                     Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Row(
    //                           children: [
    //                             Text(
    //                               "Rua: ${widget.voter.address!.address ?? 'Não informado'}",
    //                               style: AppTextStyles.p_regular,
    //                               overflow: TextOverflow.ellipsis,
    //                             ),
    //                             SizedBox(
    //                               width: 32,
    //                             ),
    //                             Text(
    //                               "Bairro: ${widget.voter.address!.district ?? 'Não informado'}",
    //                               style: AppTextStyles.p_regular,
    //                               overflow: TextOverflow.ellipsis,
    //                             ),
    //                           ],
    //                         ),
    //                         Row(
    //                           children: [
    //                             Text(
    //                               "Complemento: ${widget.voter.address!.complement ?? '---'}",
    //                               style: AppTextStyles.p_regular,
    //                               overflow: TextOverflow.ellipsis,
    //                             ),
    //                             SizedBox(
    //                               width: 32,
    //                             ),
    //                             Text(
    //                               "CEP: ${widget.voter.address!.cep ?? 'Não informado'}",
    //                               style: AppTextStyles.p_regular,
    //                               overflow: TextOverflow.ellipsis,
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   height: 64,
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: [
    //                     Container(
    //                       width: 250,
    //                       child: ButtonWidget(
    //                           label: "Alguma função",
    //                           onTap: () => {
    //                                 print("Alguma função"),
    //                               },
    //                           enabled: true),
    //                     ),
    //                     Container(
    //                       width: 250,
    //                       child: ButtonWidget(
    //                         label: "Enviar Mensagem ",
    //                         onTap: () => {
    //                           js.context.callMethod('open', [
    //                             'https://api.whatsapp.com/send?phone=55${widget.voter.phone}',
    //                           ]),
    //                           print("Enviar Mensagem no Whatsapp"),
    //                         },
    //                         enabled: true,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   height: 64,
    //                 ),
    //                 Container(
    //                   width: Get.size.width,
    //                   height: 2,
    //                   color: AppColors.primary0,
    //                 ),
    //                 SizedBox(
    //                   height: 32,
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       "Cadastrador por: ${widget.voter.leader!.name}",
    //                       style: AppTextStyles.p_regular,
    //                     ),
    //                     Text(
    //                       "CPF: ${widget.voter.leader!.cpf}",
    //                       style: AppTextStyles.p_bold,
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ));
    //     });
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
          height: 72,
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
                      widget.photo.id.toString(),
                      style: AppTextStyles.p_regular_primary,
                    ),
                    SizedBox(width: 32),
                    Text(
                      widget.photo.description!,
                      style: AppTextStyles.p_bold_tertiary,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text(
                  "Localização: ${widget.photo.latitude}, ${widget.photo.longitude}",
                  style: AppTextStyles.p_regular,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
