import 'package:flutter/widgets.dart';
import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';
import 'package:radioapp/components/mini_player.dart';

class Setting extends StatefulWidget {
  final MainTabBaseModel? mainTabBaseModel;
 Setting(this.mainTabBaseModel);
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> with AutomaticKeepAliveClientMixin<Setting> {
  @override
  void initState() {
    super.initState();
    print('initState Setting');
  }

  @override
  Widget build(BuildContext context) {
    print('build Setting');
    return Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'App Setting',
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