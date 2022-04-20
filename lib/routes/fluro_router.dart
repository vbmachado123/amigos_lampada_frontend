import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:lampada_frontend/page/landing/landing_page.dart';
import 'package:lampada_frontend/page/splash/splash_page.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static final Handler _splashHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => SplashPage());

  static final Handler _mainHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => LandingPage(
            page: params['name'][0],
            extra: '',
          )); // this one is for one paramter passing...

  // lets create for two parameters tooo...
  static final Handler _mainHandler2 = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => LandingPage(
            page: params['name'][0],
            extra: params['extra'][0],
          ));

  static void setupRouter() {
    router.define(
      '/',
      handler: _splashHandler,
    );
    router.define(
      '/main/:name',
      handler: _mainHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '/main/:name/:extra',
      handler: _mainHandler2,
      transitionType: TransitionType.fadeIn,
    );
  }
}
