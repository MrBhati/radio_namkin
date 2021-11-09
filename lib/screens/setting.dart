import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';
import 'package:radioapp/components/mini_player.dart';
import 'package:radioapp/services/color_singletion.dart';

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
   return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Expanded( 
             flex: 5,
             child: SingleChildScrollView(
               child: Column(
                 children: [
                    Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                   Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),
                              Text(
                    'More Applications',
                    style: TextStyle(fontSize: 30),
                             ),

                 ],
               ),
             ),),
           Expanded( 
             flex: 1,
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