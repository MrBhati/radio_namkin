import 'dart:io';
import 'dart:ui';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';
import 'package:radioapp/model/media_state.dart';
import 'package:radioapp/res/colors_constant.dart';
import 'package:radioapp/screens/about.dart';
import 'package:radioapp/screens/apps.dart';
import 'package:radioapp/screens/news.dart';
import 'package:radioapp/screens/player.dart';
import 'package:radioapp/screens/setting.dart';
import 'package:radioapp/services/color_singletion.dart';
import 'package:rxdart/rxdart.dart';

class MainTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return ChangeNotifierProvider<MainTabBaseModel>(create: (context) => MainTabBaseModel(context: context),
    lazy: true,
    child: Consumer<MainTabBaseModel>(
      builder: (context, data, child) {
        return DefaultTabController(
          initialIndex: 2,
          length: 5,
          child: WillPopScope(
            onWillPop: () async{
        final timegap = DateTime.now().difference(data.pre_backpress);
        final cantExit = timegap >= Duration(seconds: 2);
        data.pre_backpress = DateTime.now();
        if(cantExit){
          //show snackbar
          final snack = SnackBar(content: Text('Press Back button again to Exit'),duration: Duration(seconds: 2),);
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return false;
        }else{
          return true;
        }
      },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: ColorSingletion.instance!.colorBackground,
                title: Text("Radio Namkin "),
                actions: [
                  // action button
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      data.share();
                    },
                  ),
                  IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: new Icon(Icons.lock),
                                    title: new Text('Privacy policy'),
                                    onTap: () {
                                      const url =
                                          'https://www.riggrodigital.com/privacy-policy.html/';
                                      data.launchURL(url);
                                    },
                                  ),
                                  ListTile(
                                    leading: new Icon(Icons.thumb_up),
                                    title: new Text('Rate this app'),
                                    onTap: () {
                                      const url =
                                          'https://play.google.com/store/apps/collection/cluster?clp=igM4ChkKEzQ5MTkwODYxNzIzNzI3OTYzNzMQCBgDEhkKEzQ5MTkwODYxNzIzNzI3OTYzNzMQCBgDGAA%3D:S:ANO1ljK1U0E&gsr=CjuKAzgKGQoTNDkxOTA4NjE3MjM3Mjc5NjM3MxAIGAMSGQoTNDkxOTA4NjE3MjM3Mjc5NjM3MxAIGAMYAA%3D%3D:S:ANO1ljLG5c0&hl=en_IN&gl=US';
                                      data.launchURL(url);
                                    },
                                  ),
                                  ListTile(
                                    leading: new Icon(Icons.share),
                                    title: new Text('Share ths app'),
                                    onTap: () {
                                     data.share();
                                    },
                                  ),
                                  ListTile(
                                    leading: new Icon(Icons.close),
                                    title: new Text('Exit'),
                                    onTap: () {
                                       if (Platform.isIOS) {
          
                  try {
            exit(0); 
                  } catch (e) {
            SystemNavigator.pop(); // for IOS, not true this, you can make comment this :)
                  }
          
                } else {
          
                  try {
            SystemNavigator.pop(); // sometimes it cant exit app  
                  } catch (e) {
            exit(0); // so i am giving crash to app ... sad :(
                  }
          
                }
                                    },
                                  ),
                                ],
                              );
                            });
                      }),
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
                      // child: BackdropFilter(
                      //   filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      // ),
                    ),
                  ),
                  TabBarView(
                    children: [
                      App(data),
                      News(data),
                      Player(data),
                      About(data),
                      Setting(data)
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
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
      color: ColorSingletion.instance!.colorBackground,
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
