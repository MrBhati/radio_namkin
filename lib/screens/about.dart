import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:radioapp/components/admob_helper.dart';
import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';
import 'package:radioapp/components/mini_player.dart';

class About extends StatefulWidget {
  final MainTabBaseModel? mainTabBaseModel;
  About(this.mainTabBaseModel);
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About>
    with AutomaticKeepAliveClientMixin<About> {
  @override
  void initState() {
    super.initState();
    print('initState About');
  }

  @override
  Widget build(BuildContext context) {
    print('build About');
    // return Center(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
       
    //       Column(
    //         children: [
    //           MiniPlayer(widget.mainTabBaseModel),
    //           SizedBox(
    //             height: 50,
    //           )
    //         ],
    //       )
    //     ],
    //   ),
    // );

     return Container(
       color: Colors.black.withOpacity(0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Expanded( 
             flex: 7,
             child: SingleChildScrollView(
               child: Column(
                 children: [
                      SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/mainicon.png'),
                height: 80,
                width: 80,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'RADIO NAMKIN',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Radio Namkeen- Ek Dum Zabardast- The #1 radio FM online to listen to old Hindi audio Bollywood Songs. This online radio station plays rare & revival old romantic love songs in the 70s, 80s & 90s. Listen to Premium handpicked old Hindi Bollywood super Hits & Golden Classic songs in True Dolby HD Stereo!  old Hindi Bollywood super Hits & Radio Namkeen- Ek Dum Zabardast- The #1 radio FM online to listen to old Hindi audio Bollywood Songs. This online radio station plays rare & revival old romantic love songs in the 70s, 80s & 90s.  in True Dolby HD Stereo! Radio Namkeen- Ek Dum Zabardast- The #1 radio FM online to listen to old Hindi audio Bollywood Songs. Listen to Premium handpicked old Hindi Bollywood super Hits & Golden Classic songs in True Dolby HD Stereo!",
              style: TextStyle(fontSize: 18,
              color: Colors.white54),
            ),
          ),
          Text(
            'Find Us On ',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                image: AssetImage('assets/images/facebook.png'),
                height: 40,
                width: 40,
              ),
              Image(
                image: AssetImage('assets/images/instagram.png'),
                height: 40,
                width: 40,
              ),
              Image(
                image: AssetImage('assets/images/youtube.png'),
                height: 40,
                width: 40,
              ),
              Image(
                image: AssetImage('assets/images/twitter.png'),
                height: 40,
                width: 40,
              ),
              Image(
                image: AssetImage('assets/images/web.png'),
                height: 40,
                width: 40,
              ),
              Image(
                image: AssetImage('assets/images/chat.png'),
                height: 40,
                width: 40,
              ),
            ],
          ),
          SizedBox(height: 20,)

                 ],
               ),
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
