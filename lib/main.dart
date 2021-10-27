// ignore_for_file: public_member_api_docs

// FOR MORE EXAMPLES, VISIT THE GITHUB REPOSITORY AT:
//
//  https://github.com/ryanheise/audio_service
//
// This example implements a minimal audio handler that renders the current
// media item and playback state to the system notification and responds to 4
// media actions:
//
// - play
// - pause
// - seek
// - stop
//
// To run this example, use:
//
// flutter run

import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:radioapp/components/main_tab/main_tab.dart';
import 'package:rxdart/rxdart.dart';
import 'package:radioapp/common.dart';
import 'package:radioapp/model/media_state.dart';
import 'package:radioapp/services/audio_play_handler.dart';

import 'components/main_tab/model/main_tab_basemodel.dart';

// You might want to provide this using dependency injection rather than a
// global variable.
// late AudioHandler audioHandler;

Future<void> main() async {
  // audioHandler = await AudioService.init(
  //   builder: () => AudioPlayerHandler(),
  //   config: const AudioServiceConfig(
  //     androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
  //     androidNotificationChannelName: 'Audio playback',
  //     androidNotificationOngoing: true,
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Audio Service Demo',
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeNotifierProvider<MainTabBaseModel>(create: (context) => MainTabBaseModel(context: context),
      lazy: true, child :MainTabs(),
    ));
  }
}

// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Audio Service Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Show media item title
//             StreamBuilder<MediaItem?>(
//               stream: audioHandler.mediaItem,
//               builder: (context, snapshot) {
//                 final mediaItem = snapshot.data;
//                 return Text(mediaItem?.title ?? '');
//               },
//             ),
//             // Play/pause/stop buttons.
//             StreamBuilder<bool>(
//               stream: audioHandler.playbackState
//                   .map((state) => state.playing)
//                   .distinct(),
//               builder: (context, snapshot) {
//                 final playing = snapshot.data ?? false;
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _button(Icons.fast_rewind, audioHandler.rewind),
//                     if (playing)
//                       _button(Icons.pause, audioHandler.pause)
//                     else
//                       _button(Icons.play_arrow, audioHandler.play),
//                     _button(Icons.stop, audioHandler.stop),
//                     _button(Icons.fast_forward, audioHandler.fastForward),
//                   ],
//                 );
//               },
//             ),
//             // A seek bar.
//             StreamBuilder<MediaState>(
//               stream: _mediaStateStream,
//               builder: (context, snapshot) {
//                 final mediaState = snapshot.data;
//                 return SeekBar(
//                   duration: mediaState?.mediaItem?.duration ?? Duration.zero,
//                   position: mediaState?.position ?? Duration.zero,
//                   onChangeEnd: (newPosition) {
//                     audioHandler.seek(newPosition);
//                   },
//                 );
//               },
//             ),
//             // Display the processing state.
//             StreamBuilder<AudioProcessingState>(
//               stream: audioHandler.playbackState
//                   .map((state) => state.processingState)
//                   .distinct(),
//               builder: (context, snapshot) {
//                 final processingState =
//                     snapshot.data ?? AudioProcessingState.idle;
//                 return Text(
//                     "Processing state: ${describeEnum(processingState)}");
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// A stream reporting the combined state of the current media item and its
//   /// current position.
//   Stream<MediaState> get _mediaStateStream =>
//       Rx.combineLatest2<MediaItem?, Duration, MediaState>(
//           audioHandler.mediaItem,
//           AudioService.position,
//           (mediaItem, position) => MediaState(mediaItem, position));

//   IconButton _button(IconData iconData, VoidCallback onPressed) => IconButton(
//         icon: Icon(iconData),
//         iconSize: 64.0,
//         onPressed: onPressed,
//       );
// }


///___________________
// class MediaState {
//   final MediaItem? mediaItem;
//   final Duration position;

//   MediaState(this.mediaItem, this.position);
// }

/// An [AudioHandler] for playing a single item.
// class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
//   static final _item = MediaItem(
//     id: 'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3',
//     album: "Science Friday",
//     title: "A Salute To Head-Scratching Science",
//     artist: "Science Friday and WNYC Studios",
//     // duration: const Duration(milliseconds: 5739820),
//     artUri: Uri.parse(
//         'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
//   );

//   final _player = AudioPlayer();

//   /// Initialise our audio handler.
//   AudioPlayerHandler() {
//     // So that our clients (the Flutter UI and the system notification) know
//     // what state to display, here we set up our audio handler to broadcast all
//     // playback state changes as they happen via playbackState...
//     _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
//     // ... and also the current media item via mediaItem.
//     mediaItem.add(_item);

//     // Load the player.
//     _player.setAudioSource(AudioSource.uri(Uri.parse(_item.id)));
//   }

//   // In this simple example, we handle only 4 actions: play, pause, seek and
//   // stop. Any button press from the Flutter UI, notification, lock screen or
//   // headset will be routed through to these 4 methods so that you can handle
//   // your audio playback logic in one place.

//   @override
//   Future<void> play() => _player.play();

//   @override
//   Future<void> pause() => _player.pause();



//   @override
//   Future<void> stop() => _player.stop();

//   /// Transform a just_audio event into an audio_service state.
//   ///
//   /// This method is used from the constructor. Every event received from the
//   /// just_audio player will be transformed into an audio_service state so that
//   /// it can be broadcast to audio_service clients.
//   PlaybackState _transformEvent(PlaybackEvent event) {
//     return PlaybackState(
//       controls: [
//         MediaControl.rewind,
//         if (_player.playing) MediaControl.pause else MediaControl.play,
//         MediaControl.stop,
//         MediaControl.fastForward,
//       ],
//       systemActions: const {
      
//       },
//       androidCompactActionIndices: const [0, 1, 3],
//       processingState: const {
//         ProcessingState.idle: AudioProcessingState.idle,
//         ProcessingState.loading: AudioProcessingState.loading,
//         ProcessingState.buffering: AudioProcessingState.buffering,
//         ProcessingState.ready: AudioProcessingState.ready,
//         ProcessingState.completed: AudioProcessingState.completed,
//       }[_player.processingState]!,
//       playing: _player.playing,
//       updatePosition: _player.position,
//       bufferedPosition: _player.bufferedPosition,
//       speed: _player.speed,
//       queueIndex: event.currentIndex,
//     );
//   }
// }