import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer audioplayer = new AudioPlayer();
AudioCache audio = new AudioCache(fixedPlayer: audioplayer);
bool play = false;
bool stop = true;

audioplay() {
  if (play == false || stop == true) {
    audio.play("audios/MainTumhara.wav");
    play = true;
    stop = false;
  }
}

audiopause() {
  if (play == true) {
    audioplayer.pause();
    play = false;
  }
}

audiostop() {
  if (play == true || stop == false) {
    audioplayer.stop();
    play = false;
    stop = true;
  }
}

myImage() {
  var url =
      'https://raw.githubusercontent.com/SaranyaChattopadhyay/Flutter-pictures/master/musicImg.jpg';
  var img = Image.network(url);
  return img;
}

MaterialApp MyHome() {
  var home = Scaffold(
    appBar: AppBar(
      title: Text("All About Music"),
      backgroundColor: Colors.greenAccent.shade400,
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: 300,
          height: 50,
          child: Text(
            "Movie: Dil Bechara",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 30,
            ),
          ),
        ),
        Container(
          child: myImage(),
          alignment: Alignment.center,
          width: 500,
          height: 400,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: audioplay,
              child: Icon(Icons.play_arrow),
            ),
            RaisedButton(
              onPressed: audiopause,
              child: Icon(Icons.pause),
            ),
            RaisedButton(
              onPressed: audiostop,
              child: Icon(Icons.stop),
            )
          ],
        )
      ],
    ),
    backgroundColor: Colors.cyan.shade100,
  );

  var design = MaterialApp(
    home: home,
    debugShowCheckedModeBanner: false,
  );

  return design;
}
