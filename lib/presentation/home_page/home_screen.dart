import 'package:elevate_task/presentation/home_page/home_layout/home_desktop_layout.dart';
import 'package:elevate_task/presentation/home_page/home_layout/home_mobile_layout.dart';
import 'package:flutter/material.dart';

import '../../core/adaptive_layout.dart';
import '../../core/resuable_component/drawer.dart';
import '../../core/utils/size_config.dart';
import 'home_layout/home_tablet_layout.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
          ? AppBar(
        elevation: 0,
        backgroundColor:  Colors.white,

      )
          : null,
      backgroundColor:   Colors.white,


      body: AdaptiveLayout(
        mobileLayout: (context) =>   HomeMobileLayout(),
        tabletLayout: (context) => const HomeTabletLayout(),
        desktopLayout: (context) => const HomeDesktopLayout(),
      ),
    );

  }
}
