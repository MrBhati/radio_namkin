import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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