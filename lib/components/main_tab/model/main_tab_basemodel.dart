
import 'package:audio_service/audio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:radioapp/model/ads_mobbs.dart';
import 'package:radioapp/model/colors_model.dart';
import 'package:radioapp/model/media_state.dart';
import 'package:radioapp/services/audio_play_handler.dart';
import 'package:radioapp/services/color_singletion.dart';
import 'package:rxdart/rxdart.dart';

class MainTabBaseModel extends ChangeNotifier{
  final BuildContext? context;


//varables for setting
int selectedIndex = 0;
 List<AdsMobbs> adsMobbs = [];
  List<ColorsModel> colorsList =[
    ColorsModel(primeryColor: Color(0xff01AD1E), secondaryColor: Color(0xff), assetColor: Color(0xff),isSelected: true),
    ColorsModel(primeryColor: Color(0xffD4DB04), secondaryColor: Color(0xff), assetColor: Color(0xff)),
    ColorsModel(primeryColor: Color(0xff04DB5F), secondaryColor: Color(0xff), assetColor: Color(0xff)),
    ColorsModel(primeryColor: Color(0xff04DBC7), secondaryColor: Color(0xff), assetColor: Color(0xff)),
    ColorsModel(primeryColor: Color(0xff0497DB), secondaryColor: Color(0xff), assetColor: Color(0xff)),
    ColorsModel(primeryColor: Color(0xff0445DB), secondaryColor: Color(0xff), assetColor: Color(0xff)),
    ColorsModel(primeryColor: Color(0xff3F04DB), secondaryColor: Color(0xff), assetColor: Color(0xff)),
    ColorsModel(primeryColor: Color(0xff7904DB), secondaryColor: Color(0xff), assetColor: Color(0xff)),
    ColorsModel(primeryColor: Color(0xffC704DB), secondaryColor: Color(0xff), assetColor: Color(0xff)),
    ColorsModel(primeryColor: Color(0xffDB0497), secondaryColor: Color(0xff), assetColor: Color(0xff)),
    ColorsModel(primeryColor: Color(0xffDB0404), secondaryColor: Color(0xff), assetColor: Color(0xff)),
  ];

   MainTabBaseModel({this.context}){
      print('Main tab inside');
      apiCall();
     setupPlayer();
     ColorSingletion(
          colorBackground: Color(0xff0303e5),
          colorDark: Color(0xff3c00b4),
          colorLight: Color(0xff933532),
          colorText: Color(0xff0303e5));
       
   }
 AudioHandler? audioHandler;
updateColor(ColorsModel colorsList, int index){
    print("Change colors");
                      ColorSingletion.instance!.colorBackground = colorsList.primeryColor;
      ColorSingletion.instance!.colorDark = colorsList.secondaryColor;
      ColorSingletion.instance!.colorLight = colorsList.secondaryColor;
      ColorSingletion.instance!.colorText = colorsList.assetColor;
      selectedIndex = index;
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

  void apiCall() async {
  var dio = Dio();
  final response = await dio.post('http://fm.riggrodigital.com/radionamkin/api/public/getAdsMobbs',
    data: {"currentTime": 2021-11-12, "adminId": 1},
              options: Options(
                headers: {
                  "Accept": "application/json",
                  "Content-Type": "application/x-www-form-urlencoded"
                },
              )
  
  );
 

       var dataResponse = response.data as List;
       adsMobbs = dataResponse.map((e) => AdsMobbs.fromJson(e)).toList();

       print("Number of Adds" + adsMobbs.length.toString());

  print(response.data);
                
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

