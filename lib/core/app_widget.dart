import 'package:lampada_frontend/core/core.dart';
import 'package:lampada_frontend/page/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lampada_frontend/page/list/list_page.dart';
import 'package:lampada_frontend/page/splash/splash_page.dart';
import 'package:lampada_frontend/routes/fluro_router.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  initState() {
    Flurorouter.setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();

    // print("Largura: ${Get.width}");
    // print("Altura: ${Get.height}");
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
      onGenerateRoute: Flurorouter.router.generator,
      getPages: [
        GetPage(
            name: '/',
            page: () => const ListPage(
                  type: 'leader',
                )),
      ],
    );
  }
}
