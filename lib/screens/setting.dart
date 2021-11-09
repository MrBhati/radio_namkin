import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';
import 'package:radioapp/components/mini_player.dart';
import 'package:radioapp/model/colors_model.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Expanded( 
             flex: 5,
             child: SingleChildScrollView(
               child: Column(
                 children: [
                    Text(
                    'Change Color theam',
                    style: TextStyle(fontSize: 30),
                             ),
                               Container(
                                 height: 200,
                                 child: GridView.builder(
                  itemCount: widget.mainTabBaseModel!.colorsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        widget.mainTabBaseModel!.updateColor(widget.mainTabBaseModel!.colorsList[index],index);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 20,
                        width: 20,
                        color: widget.mainTabBaseModel!.colorsList[index].primeryColor,
                        child: widget.mainTabBaseModel!.selectedIndex == index ? Center(child: Icon(Icons.check, color: Colors.white,size: 30,),): SizedBox(),
                      ),
                    );
                
                  },
                ),
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