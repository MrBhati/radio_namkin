import 'dart:ui';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';
import 'package:radioapp/model/media_state.dart';
import 'package:radioapp/res/colors_constant.dart';
import 'package:radioapp/screens/about.dart';
import 'package:radioapp/screens/apps.dart';
import 'package:radioapp/screens/news.dart';
import 'package:radioapp/screens/player.dart';
import 'package:radioapp/screens/setting.dart';
import 'package:rxdart/rxdart.dart';

class MainTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //    return ChangeNotifierProvider<MainTabBaseModel>(create: (context) => MainTabBaseModel(context: context),
    // lazy: true,
    return Consumer<MainTabBaseModel>(
      builder: (context, data, child) {
        return DefaultTabController(
          initialIndex: 2,
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primery_color,
              title: Text("Radio Mastan "),
              actions: [
                // action button
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ],
            ),
            bottomNavigationBar: menu(),
            body: Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bg.png"),
                          fit: BoxFit.cover),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
                TabBarView(
                  children: [
                    App(data),
                    About(data),
                    Player(data),
                    News(data),
                    Setting(data)
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    // );
    // return MaterialApp(
    //   home: DefaultTabController(
    //     initialIndex: 2,
    //     length: 5,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: AppColors.primery_color,
    //         title: Text("Radio Mastan "),
    //           actions: [
    //       // action button
    //       IconButton(
    //         icon: Icon( Icons.share ),
    //         onPressed: () { },
    //       ),
    //       IconButton(
    //         icon: Icon( Icons.menu ),
    //         onPressed: () { },
    //       ),

    //     ],
    //       ),
    //       bottomNavigationBar: menu(),
    //       body: Stack(
    //         children: [
    //        Center(
    //                 child: Container(
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //               image: AssetImage(
    //                   "assets/images/bg.png"),
    //               fit: BoxFit.cover),
    //         ),
    //         child: BackdropFilter(
    //           filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
    //           child: Container(
    //             alignment: Alignment.center,
    //             color: Colors.black.withOpacity(0.1),

    //           ),
    //         ),
    //                 ),
    //               ),
    //         TabBarView(
    //           children: [
    //             App(),
    //             About(),
    //            Player(),
    //             News(),
    //             Setting()

    //           ],
    //         ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget menu() {
    return Container(
      color: AppColors.primery_color,
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
       // indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            text: "App’s",
            icon: Icon(Icons.dashboard),
          ),
          Tab(
            text: "News",
            icon: Icon(Icons.document_scanner),
          ),
          Tab(
            text: "Radio",
            icon: Icon(Icons.play_circle),
          ),
          Tab(
            text: "About",
            icon: Icon(Icons.explicit_rounded),
          ),
          Tab(
            text: "Setting",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
