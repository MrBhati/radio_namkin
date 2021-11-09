
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:radioapp/model/media_state.dart';
import 'package:radioapp/services/audio_play_handler.dart';
import 'package:radioapp/services/color_singletion.dart';
import 'package:rxdart/rxdart.dart';

class MainTabBaseModel extends ChangeNotifier{
  final BuildContext? context;

    String background = "#B7C8DB",
      dark = "#9caaba",
      light = "#d2e6fc",
      text = "1E364B";
   MainTabBaseModel({this.context}){
      print('Main tab inside');
     setupPlayer();
     ColorSingletion(
          colorBackground: Color(0xff0303e5),
          colorDark: Color(0xff3c00b4),
          colorLight: Color(0xff933532),
          colorText: Color(0xff0303e5));
       
   }
 AudioHandler? audioHandler;
changeColor(){
    print("Change colors");
                      ColorSingletion.instance!.colorBackground = Color(0xff4d54d1);
      ColorSingletion.instance!.colorDark = Color(0xfffa532b);
      ColorSingletion.instance!.colorLight = Color(0xff0bc144);
      ColorSingletion.instance!.colorText = Color(0xffff1388);
      notifyListeners();
}

 setupPlayer() async{
   print("setup player call");
    audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.example.testurl',
      androidNotificationChannelName: 'testurl',
      androidNotificationOngoing: true,
    ),
  );
  notifyListeners();
 }

  /// A stream reporting the combined state of the current media item and its
  /// current position.
  Stream<MediaState> get _mediaStateStream =>
      Rx.combineLatest2<MediaItem?, Duration, MediaState>(
       audioHandler!.mediaItem,
          AudioService.position,
          (mediaItem, position) => MediaState(mediaItem, position));

bool isPlaying =true;
   playRadio(){
     print("Play radio");
     isPlaying = !isPlaying;
     notifyListeners();
   }


}

