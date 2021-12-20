import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:radioapp/components/admob_helper.dart';
import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';
import 'package:radioapp/components/mini_player.dart';

class News extends StatefulWidget {
  final MainTabBaseModel? mainTabBaseModel;
 News(this.mainTabBaseModel);
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with AutomaticKeepAliveClientMixin<News> {
  @override
  void initState() {
    super.initState();
    print('initState News');
  }

  @override
  Widget build(BuildContext context) {
    print('build News');
 return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Expanded( 
             flex: 7,
             child: SingleChildScrollView(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Center(child:   Container(
                   
                     height: 300,
                     child: Center(
                       child: Text(
                        "News Not Avelable for now",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                     ),
                   ),)
//                  Container(
//                    height: 600,
//                    child: GridView.count(
//   // Create a grid with 2 columns. If you change the scrollDirection to
//   // horizontal, this produces 2 rows.
//   crossAxisCount: 2,
//   // Generate 100 widgets that display their index in the List.
//   children: List.generate(100, (index) {
//     return Center(
//       child: Card(
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(40), // if you need this
//     side: BorderSide(
//       color: Colors.grey.withOpacity(0.2),
//       width: 1,
//     ),
//   ),
//   child: Container(
//     color: Colors.white,
//     width: 200,
//     height: 200,
//   ),
// ),
//     );
//   }),
// ),
//                  ),

                 ],
               ),
             ),),
         
            MiniPlayer(widget.mainTabBaseModel),
            Container(
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
        height: 60,
      ),
          ],
        ),
      );
  }

  @override
  bool get wantKeepAlive => true;
}