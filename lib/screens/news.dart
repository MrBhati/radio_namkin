import 'package:flutter/material.dart';
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
             flex: 6,
             child: SingleChildScrollView(
               child: Column(
                 children: [
                 Container(
                   height: 600,
                   child: GridView.count(
  // Create a grid with 2 columns. If you change the scrollDirection to
  // horizontal, this produces 2 rows.
  crossAxisCount: 2,
  // Generate 100 widgets that display their index in the List.
  children: List.generate(100, (index) {
    return Center(
      child: Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40), // if you need this
    side: BorderSide(
      color: Colors.grey.withOpacity(0.2),
      width: 1,
    ),
  ),
  child: Container(
    color: Colors.white,
    width: 200,
    height: 200,
  ),
),
    );
  }),
),
                 ),

                 ],
               ),
             ),),
           Expanded( 
             flex: 2,
             child: Container(
               color:Colors.pink,
               child: Column(
                 children: [
                    MiniPlayer(widget.mainTabBaseModel),
                SizedBox(height: 50,)
                 ],
               ),
             ),
           ),
          ],
        ),
      );
  }

  @override
  bool get wantKeepAlive => true;
}