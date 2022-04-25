import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lampada_frontend/core/core.dart';
import 'package:lampada_frontend/page/home/home_page.dart';
import 'package:lampada_frontend/page/list/list_page.dart';
import 'package:lampada_frontend/page/map/map_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Widget body;

  @override
  void initState() {
    // body = HomePage();
    // body = MapPage();
    body = ListPage(
      type: ListType.voter,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white0,
      body: Column(children: [
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
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(32),
          width: double.maxFinite,
          height: Get.size.height - 72,
          child: Center(
            child: body,
          ),
        )
      ]),
    );
  }
}
