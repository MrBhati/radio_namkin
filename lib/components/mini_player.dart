import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radioapp/components/main_tab/model/main_tab_basemodel.dart';
import 'package:radioapp/res/colors_constant.dart';
import 'package:radioapp/screens/apps.dart';
import 'package:radioapp/services/color_singletion.dart';

class MiniPlayer extends StatefulWidget {
  final MainTabBaseModel? mainTabBaseModel;
 MiniPlayer(this.mainTabBaseModel);
  @override
  _MiniPlayerState createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer>{
  @override
  void initState() {
    super.initState();
    print('initState MiniPlayer');
  }

  @override
  Widget build(BuildContext context) {
    print('build Apps');
    return Container(
      color: ColorSingletion.instance!.colorBackground,
      height: 60,
      width: double.infinity,
     child: Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
 Row(
   crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,children: [

 if(widget.mainTabBaseModel!.audioHandler != null)
               StreamBuilder<bool>(
              stream: widget.mainTabBaseModel!.audioHandler!.playbackState.map((state) => state.playing)
                  .distinct(),
              builder: (context, snapshot) {
                final playing = snapshot.data ?? false;

return  Container(
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
            ),);
              },
            ),


  //   IconButton(
  // icon: Icon( Icons.play_circle , color: Colors.white,
  // size: 30,),
  // onPressed: () { },
  //           ),
             Text("Hindi Bollywood Golden Class",
             style: TextStyle(color: Colors.white,
             fontWeight: FontWeight.w600,
             fontSize: 20)
            ,),
 ],),
             IconButton(
              icon: Icon( Icons.share ,color: Colors.white),
              onPressed: () { },
            ),

      ],),
       
      );
  }
}