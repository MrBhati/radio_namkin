import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class BannerAdd extends StatefulWidget {

 BannerAdd();
  @override
  _BannerAddState createState() => _BannerAddState();
}

class _BannerAddState extends State<BannerAdd>{


  late BannerAd _bannerAd;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
        onAdWillDismissScreen: (Ad ad) => print('$BannerAd onApplicationExit.'),
      ),
    );

    _bannerAd.load();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
    // _bannerAd
  }

  @override
  Widget build(BuildContext context) {
    final AdWidget adWidget = AdWidget(ad: _bannerAd);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Mobile Ads'),
        actions: <Widget>[
        ],
      ),
      body: Column(
        children: [
          Align(
            alignment: FractionalOffset.topCenter,
            child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  child: adWidget,
                  width: _bannerAd.size.width.toDouble(),
                  height: _bannerAd.size.height.toDouble(),
                )
            ),
          )
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   print('build Apps');
  //   return Container(
  //     color: Colors.pink,
  //     height: 60,
  //     width: double.infinity,
     
       
  //     );
  // }
}