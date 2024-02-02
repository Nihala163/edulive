import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.cyan[100],
      body: ListView(children: [

        Padding(
          padding: const EdgeInsets.only(left: 20,top: 20),
          child: Row(
            children: [
              InkWell(onTap: () {
                Navigator.pop(context);
              },
                  child: Icon(Icons.arrow_back,size: 30.r,)),
              SizedBox(width: 20.w,),
              Text(
                'Vedio Player',
                style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5.0,
                      offset: const Offset(0.0, 5.0)),
                ],
                borderRadius: BorderRadius.circular(10).r,
                color: Colors.cyan[100]),
            child: YoutubePlayer(
              bottomActions: [
                CurrentPosition(),
                ProgressBar(isExpanded: true),

                // TotalDuration(),
              ],
              controller: YoutubePlayerController(
                initialVideoId: widget.vedioId,
                flags: YoutubePlayerFlags(
                    autoPlay: true,
                    mute: true,
                    disableDragSeek: true,
                    showLiveFullscreenButton: true,
                    useHybridComposition: true,
                    loop: true,
                    isLive: true,
                    forceHD: true,
                    enableCaption: true,
                    controlsVisibleAtStart: true,
                    hideThumbnail: false),
              ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
          ),
        ),
      ]),
    );
  }
}
