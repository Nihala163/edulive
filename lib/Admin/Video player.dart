import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Vedioplayer extends StatefulWidget {
  const Vedioplayer({
    super.key,
    required this.vedioId,
    // required List<QueryDocumentSnapshot<Map<String, dynamic>>> this.vedioId
  });
  final vedioId;

  @override
  State<Vedioplayer> createState() => _VedioplayerState();
}

class _VedioplayerState extends State<Vedioplayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vedio Player')),
      body: Column(children: [
        YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: widget.vedioId,
            flags: YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
              disableDragSeek: false,
              loop: false,
              isLive: false,
              forceHD: false,
              enableCaption: true,
            ),
          ),
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
        ),
      ]),
    );
  }
}
