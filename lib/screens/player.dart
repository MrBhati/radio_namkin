import 'package:audio_service/audio_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:radioapp/components/admob_helper.dart';
import 'package:radioapp/components/banner_add.dart';
import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';
import 'package:radioapp/components/mini_player.dart';

import 'package:radioapp/res/colors_constant.dart';
import 'package:radioapp/services/color_singletion.dart';
class Player extends StatefulWidget {
  final MainTabBaseModel? mainTabBaseModel;
 
  Player(this.mainTabBaseModel);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> with AutomaticKeepAliveClientMixin<Player> {
   final List<String> imagesList = [
    'https://cdn-profiles.tunein.com/s302082/images/logod.png',
    'http://fm.riggrodigital.com/admob/system/static/uploads/banner/a4C3rGUr.jpg',
    'http://fm.riggrodigital.com/admob/system/static/uploads/banner/Ufn5X2VF.png',
    'http://fm.riggrodigital.com/admob/system/static/uploads/banner/r5d9jNjU.jpg',
    'http://fm.riggrodigital.com/admob/system/static/uploads/banner/CF3ThVmN.png',
  ];
  @override
  void initState() {
    super.initState();
    print('initState Player');
  }

  @override
  Widget build(BuildContext context) {
    print('build Player');
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           

            CarouselSlider(
        options: CarouselOptions(
        aspectRatio: 20 / 9,
          autoPlay: true,
        ),
        items: this.imagesList
            .map(
              (item,) => Center(
              
                child: imagesList.indexOf(item)  == 0 ? Container(
                  height: 600,
                  width: 600,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorSingletion.instance!.colorBackground,
                shape: BoxShape.circle
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 120,
               backgroundImage: NetworkImage(item),
              )): Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.network(
                    item,
                    height: 1000,
                    fit: BoxFit.cover,
                  ),
              ),
              ),
            )
            .toList(),
      ),
            
            SizedBox(height: 50,),
            Image(image: AssetImage('assets/images/wave.png')),
             SizedBox(height: 20,),
             if(widget.mainTabBaseModel!.audioHandler != null)
               StreamBuilder<bool>(
              stream: widget.mainTabBaseModel!.audioHandler!.playbackState.map((state) => state.playing)
                  .distinct(),
              builder: (context, snapshot) {
                final playing = snapshot.data ?? false;

return  Padding(
               padding: const EdgeInsets.symmetric(horizontal: 40),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                       decoration: BoxDecoration(
                  color: ColorSingletion.instance!.colorBackground,
                  shape: BoxShape.circle
                ),
                child:  IconButton(
                icon: Icon( Icons.favorite_border , color: Colors.white,),
                onPressed: () { 
                  const url =
                                        'https://play.google.com/store/apps/collection/cluster?clp=igM4ChkKEzQ5MTkwODYxNzIzNzI3OTYzNzMQCBgDEhkKEzQ5MTkwODYxNzIzNzI3OTYzNzMQCBgDGAA%3D:S:ANO1ljK1U0E&gsr=CjuKAzgKGQoTNDkxOTA4NjE3MjM3Mjc5NjM3MxAIGAMSGQoTNDkxOTA4NjE3MjM3Mjc5NjM3MxAIGAMYAA%3D%3D:S:ANO1ljLG5c0&hl=en_IN&gl=US';
                                    widget.mainTabBaseModel!.launchURL(url);
                },
            ),),
            Container(
                       decoration: BoxDecoration(
                  color: ColorSingletion.instance!.colorBackground,
                  shape: BoxShape.circle
                ),
                child:  IconButton(
                icon: Icon( widget.mainTabBaseModel!.isPlaying ? Icons.play_circle :Icons.av_timer , color: Colors.white,),
                onPressed: () { 
                  widget.mainTabBaseModel!.playRadio();
                },
            ),),
            Container(
                height: 80,
                width: 80,
                       decoration: BoxDecoration(
                         
                  color: ColorSingletion.instance!.colorBackground,
                  shape: BoxShape.circle
                ),
                child:  playing ? IconButton(
                icon: Icon( Icons.pause , color: Colors.white,
                size: 40,),
                onPressed: () { widget.mainTabBaseModel!.audioHandler!.pause();},
            ): IconButton(
                icon: Icon( Icons.play_arrow , color: Colors.white,
                size: 40,),
                onPressed: () {  widget.mainTabBaseModel!.audioHandler!.play();},
            ),),
            Container(
                       decoration: BoxDecoration(
                  color: ColorSingletion.instance!.colorBackground,
                  shape: BoxShape.circle
                ),
                child:  IconButton(
                icon: Icon( Icons.volume_up , color: Colors.white,),
                onPressed: () { },
            ),),
            Container(
                       decoration: BoxDecoration(
                  color: ColorSingletion.instance!.colorBackground,
                  shape: BoxShape.circle
                ),
                child:  IconButton(
                icon: Icon( Icons.share , color: Colors.white,),
                onPressed: () {
                  widget.mainTabBaseModel!.share();
                 },
            ),)
            
                 ],
               ),
             );

              },
            ),

            
              SizedBox(height: 10,),
             if(widget.mainTabBaseModel!.audioHandler != null)
                StreamBuilder<AudioProcessingState>(
              stream: widget.mainTabBaseModel!.audioHandler!.playbackState
                  .map((state) => state.processingState)
                  .distinct(),
              builder: (context, snapshot) {
             
                final processingState =
                    snapshot.data ?? AudioProcessingState.idle;
                return Text("Radio Namkin- Ek Dum Zabardast",
             style: TextStyle(color: Colors.white,
             fontWeight: FontWeight.w600,
             fontSize: 20),);
            
              },
            ),
      //      Container(
      //   child: AdWidget(
      //     ad: AdmobHelper.getBannerAd()..load(),
      //     key: UniqueKey(),
      //   ),
      //   height: 50,
      // ),
           

            //  Padding(
            //    padding: const EdgeInsets.symmetric(horizontal: 40),
            //    child: Row(
            //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //      children: [
            //        Container(
            //            decoration: BoxDecoration(
            //       color: AppColors.primery_color,
            //       shape: BoxShape.circle
            //     ),
            //     child:  IconButton(
            //     icon: Icon( Icons.favorite_border , color: Colors.white,),
            //     onPressed: () { },
            // ),),
            // Container(
            //            decoration: BoxDecoration(
            //       color: AppColors.primery_color,
            //       shape: BoxShape.circle
            //     ),
            //     child:  IconButton(
            //     icon: Icon( widget.mainTabBaseModel!.isPlaying ? Icons.play_circle :Icons.av_timer , color: Colors.white,),
            //     onPressed: () { 
            //       widget.mainTabBaseModel!.playRadio();
            //     },
            // ),),
            // Container(
            //     height: 80,
            //     width: 80,
            //            decoration: BoxDecoration(
                         
            //       color: AppColors.primery_color,
            //       shape: BoxShape.circle
            //     ),
            //     child:  IconButton(
            //     icon: Icon( Icons.play_circle , color: Colors.white,
            //     size: 40,),
            //     onPressed: () { },
            // ),),
            // Container(
            //            decoration: BoxDecoration(
            //       color: AppColors.primery_color,
            //       shape: BoxShape.circle
            //     ),
            //     child:  IconButton(
            //     icon: Icon( Icons.volume_up , color: Colors.white,),
            //     onPressed: () { },
            // ),),
            // Container(
            //            decoration: BoxDecoration(
            //       color: AppColors.primery_color,
            //       shape: BoxShape.circle
            //     ),
            //     child:  IconButton(
            //     icon: Icon( Icons.share , color: Colors.white,),
            //     onPressed: () { },
            // ),)
            
            //      ],
            //    ),
            //  )
          ],
        )
      );
  }

//  IconButton _button(IconData iconData, VoidCallback onPressed) => IconButton(
//         icon: Icon(iconData),
//         iconSize: 64.0,
//         onPressed: onPressed,
//       );
  @override
  bool get wantKeepAlive => true;
}