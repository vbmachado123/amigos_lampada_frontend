import 'package:flutter/material.dart';
import 'package:lampada_frontend/core/core.dart';
import 'package:lampada_frontend/shared/widget/toolbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white0,
      body: Column(children: [
        ToolbarWidget(),
      ]),
    );
  }
}
