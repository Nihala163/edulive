import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VedioplayerUser extends StatefulWidget {
  const VedioplayerUser({
    super.key,
    required this.vedioId,
    // required List<QueryDocumentSnapshot<Map<String, dynamic>>> this.vedioId
  });
  final vedioId;

  @override
  State<VedioplayerUser> createState() => _VedioplayerUserState();
}

class _VedioplayerUserState extends State<VedioplayerUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.indigo.shade900,
        title: Text('Vedio Player'),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: ListView(children: [
        SizedBox(
          height: 10.h,
        ),
        YoutubePlayer(
          bottomActions: [
            CurrentPosition(),
            ProgressBar(isExpanded: true),

            // TotalDuration(),
          ],
          controller: YoutubePlayerController(
            initialVideoId: widget.vedioId,
            flags: YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
                disableDragSeek: false,
                showLiveFullscreenButton: true,
                // useHybridComposition: true,
                loop: false,
                isLive: false,
                forceHD: false,
                enableCaption: true,
                controlsVisibleAtStart: true,
                hideThumbnail: false),
          ),
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
        ),
      ]),
    );
  }
}
