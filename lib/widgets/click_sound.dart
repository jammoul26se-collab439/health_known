import 'package:audioplayers/audioplayers.dart';

class ClickSound {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> play() async {
    await _player.stop();

    await _player.play(
      AssetSource('sounds/ClickSoundTrack.m4a'),
    );
  }
}