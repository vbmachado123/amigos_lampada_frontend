import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lampada_frontend/page/home/home_page.dart';
import 'package:lampada_frontend/page/list/list_page.dart';
import 'package:lampada_frontend/page/map/map_page.dart';
import 'package:lampada_frontend/shared/widget/toolbar_item_widget.dart';

import '../../core/core.dart';

class ToolbarWidget extends StatefulWidget {
  const ToolbarWidget({Key? key}) : super(key: key);

  @override
  State<ToolbarWidget> createState() => _ToolbarWidgetState();
}

class _ToolbarWidgetState extends State<ToolbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 12,
      ),
      width: double.maxFinite,
      height: 72,
      decoration: BoxDecoration(
        color: AppColors.tertiary0,
        boxShadow: [
          AppShadows.shadow0,
          AppShadows.shadow0,
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/amigos_lampada_logo.svg",
                height: 64,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Amigos da Lâmpada",
                  style: AppTextStyles.h6_bold_white,
                ),
              )
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              ToolbarItemWidget(
                label: "Dashboard",
                isSelected: true,
                page: HomePage(),
              ),
              ToolbarItemWidget(
                label: "Mapa",
                isSelected: false,
                page: MapPage(),
              ),
              ToolbarItemWidget(
                label: "Eleitores",
                isSelected: false,
                page: ListPage(
                  type: 'voter',
                ),
              ),
              ToolbarItemWidget(
                label: "Colaboradores",
                isSelected: false,
                page: ListPage(
                  type: 'leader',
                ),
              ),
              SizedBox(
                width: 72,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Olá, ",
                style: AppTextStyles.p_bold_white,
              ),
              Text(
                "admin",
                style: AppTextStyles.p_regular_white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
