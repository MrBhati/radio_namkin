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
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'All news App',
              style: TextStyle(fontSize: 30),
            ),
           Column(
             children: [
                MiniPlayer(widget.mainTabBaseModel),
            SizedBox(height: 50,)
             ],
           )
          ],
        ),
      );
  }

  @override
  bool get wantKeepAlive => true;
}