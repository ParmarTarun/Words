import 'package:flutter/material.dart';

import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

class WordTitle extends StatelessWidget {
  final String title;

  WordTitle(this.title);

  void _playWord(String toSpeak) {
    VoiceController controller = FlutterTextToSpeech.instance.voiceController();

    controller.init().then((_) {
      controller.speak(toSpeak);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 18),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.subhead,
          ),
          IconButton(
            icon: Icon(
              Icons.play_arrow,
              size: 40.0,
            ),
            onPressed: ()=>_playWord(title),
          )
        ],
      ),
    );
  }
}
