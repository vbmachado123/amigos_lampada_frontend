import 'package:lampada_frontend/core/core.dart';
import 'package:lampada_frontend/page/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lampada_frontend/page/landing/landing_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();

    print("Largura: ${Get.width}");
    print("Altura: ${Get.height}");
    return GetMaterialApp(
      initialRoute: '/',
      color: AppColors.primary0,
      debugShowCheckedModeBanner: false,

      // builder: (context, widget) {
      //   ScreenUtil.setContext(context);
      //   return MediaQuery(
      //       data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      //       child: widget!);
      // },
      theme: ThemeData(
        // primarySwatch: MaterialColor(1, ),
        primarySwatch: Colors.yellow,
        focusColor: AppColors.primary0,
      ),
      getPages: [
        GetPage(name: '/', page: () => LandingPage()),
      ],
    );
  }
}
