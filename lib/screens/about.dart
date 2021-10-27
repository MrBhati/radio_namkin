import 'package:flutter/material.dart';
import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';
import 'package:radioapp/components/mini_player.dart';

class About extends StatefulWidget {
  final MainTabBaseModel? mainTabBaseModel;
 About(this.mainTabBaseModel);
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> with AutomaticKeepAliveClientMixin<About> {
  @override
  void initState() {
    super.initState();
    print('initState About');
  }

  @override
  Widget build(BuildContext context) {
    print('build About');
    return Center(
     child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'About App',
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