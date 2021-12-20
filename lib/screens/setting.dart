import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:radioapp/components/admob_helper.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Expanded(
             flex: 7,
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   SizedBox(
                     height: 20,
                   ),
                    Container(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                        'Customize color theme',
                        
                        style: TextStyle(fontSize: 30,
                        color: Colors.white),
                                 ),
                      ),
                    ),
                     SizedBox(
                     height: 20,
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