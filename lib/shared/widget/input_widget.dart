import 'package:lampada_frontend/core/core.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * @author Victor Balbino
 * @date 28/04/2021 
 * @description Widget Criado para Ser o Input Padrão para toda a aplicação
 */
class InputWidget extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  String hint;
  final bool obscureText;
  final String maskType;
  final IconButton? prefixIcon;
  final TextEditingController controller;
  final String? subLabel;
  final IconButton? suffixIcon;
  final String? maskedTextField;

  int maxLines;

  InputWidget.text(
      {required this.label,
      required String hint,
      required this.prefixIcon,
      required this.controller})
      //  : this.label = label,
      : this.suffixIcon = null,
        this.keyboardType = TextInputType.name,
        this.obscureText = false,
        this.maskedTextField = null,
        this.subLabel = "",
        this.maskType = "",
        this.maxLines = 1,
        this.hint = hint;

  InputWidget.textWithSubLabel(
      {required String label,
      required String hint,
      required this.prefixIcon,
      required this.subLabel,
      required this.controller})
      : this.label = label,
        this.suffixIcon = null,
        this.keyboardType = TextInputType.number,
        this.obscureText = false,
        this.maskedTextField = null,
        this.maskType = "",
        this.maxLines = 1,
        this.hint = hint;

  InputWidget.email(
      {required String label,
      required String hint,
      required this.prefixIcon,
      required this.controller})
      : this.label = label,
        this.suffixIcon = null,
        this.subLabel = "",
        this.maskedTextField = null,
        this.keyboardType = TextInputType.emailAddress,
        this.obscureText = false,
        this.maskType = "",
        this.maxLines = 1,
        this.hint = hint;

  InputWidget.password(
      {required String label,
      required this.prefixIcon,
      required this.controller})
      : this.label = label,
        this.suffixIcon = null,
        this.subLabel = "",
        this.maskedTextField = null,
        this.keyboardType = TextInputType.visiblePassword,
        this.obscureText = true,
        this.maxLines = 1,
        this.maskType = "",
        this.hint = "**********";

  InputWidget.textArea(
      {required String label,
      required this.prefixIcon,
      required hint,
      required this.controller})
      : this.label = label,
        this.subLabel = "",
        this.suffixIcon = null,
        this.maskedTextField = null,
        this.keyboardType = TextInputType.multiline,
        this.obscureText = false,
        this.hint = hint,
        this.maxLines = 0,
        this.maskType = "";

  InputWidget.number(
      {required String label,
      required String hint,
      required this.prefixIcon,
      required this.controller})
      : this.label = label,
        this.suffixIcon = null,
        this.subLabel = "",
        this.maskedTextField = null,
        this.keyboardType = TextInputType.number,
        this.obscureText = false,
        this.maskType = "",
        this.maxLines = 1,
        this.hint = hint;

  InputWidget.cpf(
      {required String label,
      // required String hint,
      required this.prefixIcon,
      required this.controller})
      : this.label = label,
        this.suffixIcon = null,
        this.subLabel = "",
        this.maskedTextField = "Cpf",
        this.keyboardType = TextInputType.number,
        this.obscureText = false,
        this.maskType = "cpf",
        this.maxLines = 1,
        this.hint = "000.000.000-00";

  InputWidget.birthday(
      {required String label,
      // required String hint,
      required this.prefixIcon,
      required this.controller})
      : this.label = label,
        this.suffixIcon = null,
        this.subLabel = "",
        this.maskedTextField = "Birthday",
        this.keyboardType = TextInputType.number,
        this.obscureText = false,
        this.maskType = "birthday",
        this.maxLines = 1,
        this.hint = "00/00/0000";

  InputWidget.phone(
      {required String label,
      // required String hint,
      required this.prefixIcon,
      required this.controller})
      : this.label = label,
        this.suffixIcon = null,
        this.subLabel = "",
        this.maskedTextField = "Phone",
        this.keyboardType = TextInputType.number,
        this.obscureText = false,
        this.maskType = "phone",
        this.maxLines = 1,
        this.hint = "(00) 00000-0000";

  InputWidget.iconButton(
      {required String label,
      required String hint,
      required this.suffixIcon,
      required this.prefixIcon,
      required this.controller})
      : this.label = label,
        this.subLabel = "",
        this.maskedTextField = null,
        this.keyboardType = TextInputType.number,
        this.obscureText = false,
        this.maskType = "",
        this.maxLines = 1,
        this.hint = hint;

  @override
  Widget build(BuildContext context) {
    String formattingNumber = "";

    switch (maskType) {
      case "phone":
        formattingNumber = "(##) #####-####";
        break;
      case "cpf":
        formattingNumber = "###.###.###-##";
        break;
      case "birthday":
        formattingNumber = "##/##/####";
        break;
      default:
        formattingNumber = "";
    }

    var maskFormatter = MaskTextInputFormatter(
        mask: formattingNumber.replaceAll("0", "#"),
        filter: {"#": RegExp(r'[0-9]')});

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Text(
              label,
              style: AppTextStyles.p_bold,
              textAlign: TextAlign.start,
            ),
            Text(
              subLabel.toString(),
              style: AppTextStyles.p_bold,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondary0,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
            // boxShadow: [
            //   AppShadows.shadow0,
            // ],
          ),
          child: TextField(
            controller: controller,
            autocorrect: true,
            maxLines: (maxLines <= 0) ? null : maxLines,
            inputFormatters: (maskFormatter != "") ? [maskFormatter] : null,
            obscureText: this.obscureText,
            keyboardType: this.keyboardType,
            style: AppTextStyles.p_regular,
            decoration: InputDecoration(
              errorText: null,

              prefixIcon: prefixIcon ?? prefixIcon,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              suffixIcon: this.suffixIcon,
              hoverColor: AppColors.primary0,
              focusColor: AppColors.primary0,
              hintText: this.hint,
              hintStyle: AppTextStyles.p_regular_grey,
              fillColor: AppColors.white_1,
              filled: false,
              // floatingLabelBehavior: FloatingLabelBehavior.never,
              alignLabelWithHint: false,
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
