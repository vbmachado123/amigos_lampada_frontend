import 'package:flutter/material.dart';
import 'package:lampada_frontend/core/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamed(context, '/main/home');
    });
    return Scaffold(
      backgroundColor: AppColors.white0,
      body: Container(
        child: Center(
          child: Text('Splash'),
        ),
      ),
    );
  }
}
