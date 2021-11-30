import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:radioapp/components/admob_helper.dart';

import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';
import 'package:radioapp/components/mini_player.dart';

class App extends StatefulWidget {
final MainTabBaseModel? mainTabBaseModel;
 App(this.mainTabBaseModel);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with AutomaticKeepAliveClientMixin<App> {
  @override
  void initState() {
    super.initState();
    print('initState App');
  }

  @override
  Widget build(BuildContext context) {
    print('build Apps');
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Expanded( 
             flex: 7,
             child: SingleChildScrollView(
               child: Column(
                children:[ ]
               ),
              //  child: Column(
              //    children: [
              //       Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //      Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),
              //                 Text(
              //       'More Applications',
              //       style: TextStyle(fontSize: 30),
              //                ),

              //    ],
              //  ),
             ),),
            MiniPlayer(widget.mainTabBaseModel),
           Container(
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
        height: 50,
      ),
          ],
        ),
      );
  }

  @override
  bool get wantKeepAlive => true;
}