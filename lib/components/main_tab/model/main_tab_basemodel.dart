
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:radioapp/model/media_state.dart';
import 'package:radioapp/services/audio_play_handler.dart';
import 'package:rxdart/rxdart.dart';

class MainTabBaseModel extends ChangeNotifier{
  final BuildContext? context;
   MainTabBaseModel({this.context}){
      print('Main tab inside');
     setupPlayer();
       
   }
 AudioHandler? audioHandler;

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

