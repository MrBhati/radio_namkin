import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';

import 'package:radioapp/res/colors_constant.dart';
import 'package:radioapp/services/color_singletion.dart';
class Player extends StatefulWidget {
  final MainTabBaseModel? mainTabBaseModel;
  Player(this.mainTabBaseModel);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> with AutomaticKeepAliveClientMixin<Player> {
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
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorSingletion.instance!.colorBackground,
                shape: BoxShape.circle
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 120,
                backgroundImage: AssetImage(
                            "assets/images/mainicon.png"),
              ),
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
                onPressed: () { },
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
                onPressed: () { },
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
             SizedBox(height: 40,),

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