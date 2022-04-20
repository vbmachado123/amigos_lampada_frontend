import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lampada_frontend/core/core.dart';
import 'package:lampada_frontend/page/home/home_page.dart';
import 'package:lampada_frontend/page/landing/model/item_toolbar_model.dart';
import 'package:lampada_frontend/page/list/list_page.dart';
import 'package:lampada_frontend/page/map/map_page.dart';
import 'package:lampada_frontend/shared/widget/toolbar_item_widget.dart';
import 'package:lampada_frontend/shared/widget/toolbar_widget.dart';

class LandingPage extends StatefulWidget {
  final String page;
  final String extra;
  const LandingPage({Key? key, required this.page, required this.extra})
      : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<String> pages = [
    'home',
    'leader',
    'voter',
    'map',
  ];

  List<ItemToolbarModel> items = [
    ItemToolbarModel(
      label: 'Home',
      isSelected: true,
      icons: Icons.home,
    ),
    ItemToolbarModel(
      label: 'Leader',
      isSelected: false,
      icons: Icons.person,
    ),
    ItemToolbarModel(
      label: 'Voter',
      isSelected: false,
      icons: Icons.person,
    ),
    ItemToolbarModel(
      label: 'Map',
      isSelected: false,
      icons: Icons.map,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white0,
      body: Container(
        child: Column(
          children: [
            Container(
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
                    children: items.map((e) {
                      return ToolbarItemWidget(
                        isSelected:
                            items.indexOf(e) == pages.indexOf(widget.page),
                        label: e.label,
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/main/${pages[items.indexOf(e)]}');
                        },
                      );
                    }).toList(),
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
            ),
            Container(
                width: Get.width,
                height: Get.height,
                child: Center(
                  child: IndexedStack(
                    index: pages.indexOf(widget.page),
                    children: [
                      HomePage(),
                      ListPage(type: 'leader'),
                      ListPage(type: 'voter'),
                      MapPage(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
