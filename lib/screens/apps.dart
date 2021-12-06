import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:radioapp/components/admob_helper.dart';

import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';
import 'package:radioapp/components/mini_player.dart';
import 'package:radioapp/services/color_singletion.dart';

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
              GestureDetector(
                onTap: (){
                const url =
                                        'https://play.google.com/store/apps/collection/cluster?clp=igM4ChkKEzQ5MTkwODYxNzIzNzI3OTYzNzMQCBgDEhkKEzQ5MTkwODYxNzIzNzI3OTYzNzMQCBgDGAA%3D:S:ANO1ljK1U0E&gsr=CjuKAzgKGQoTNDkxOTA4NjE3MjM3Mjc5NjM3MxAIGAMSGQoTNDkxOTA4NjE3MjM3Mjc5NjM3MxAIGAMYAA%3D%3D:S:ANO1ljLG5c0&hl=en_IN&gl=US';
                                   widget.mainTabBaseModel!.launchURL(url);  
                },
                child: Expanded( 
                           flex: 7,
                           child: SingleChildScrollView(
                 child: Column(
                          
                  children:[ 
                    SizedBox(height: 80,),
                    Text("Checkout More Radio App's",
                    style: TextStyle(color: Colors.white,
                    fontSize: 25),),
              Image(
                            image: AssetImage('assets/images/moreApps.png'),
                           // height: 40,
                            width: double.infinity,
                          ),
                          Container(
                            color: ColorSingletion.instance!.colorBackground,
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Text("See More App's",
                            style: TextStyle(fontSize: 16, color: Colors.white),),
                          )
                  
                  ]
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
              ),
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