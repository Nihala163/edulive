import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edulive/Admin/Add%20video.dart';
// import 'package:edulivekmo/Searchbar/searchbar.dart';
// import 'package:edulivekmo/discussion/widgets/searchbar.dart';

// import 'package:edulivekmo/vedio/Vidioplayer.dart';
// import 'package:edulivekmo/vedio/addvedio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Video player.dart';

class Uservideolist extends StatefulWidget {
  const Uservideolist({super.key});

  @override
  State<Uservideolist> createState() => _UservideolistState();
}

class _UservideolistState extends State<Uservideolist> {
  var Links;
  var searchName = '';
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan[50],
        surfaceTintColor: Colors.cyan[50],
        title: Text('Video List'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return Searchbar5();
                //   },
                // ));
              },
              icon: Icon(Icons.search))
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => AddVideo(),
      //           ));
      //     },
      //     child: Icon(Icons.add)),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('FirstyearVediourl')
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Align(
                  alignment: Alignment.topCenter,
                  child: LinearProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('-----------------${snapshot.error}');
            }

            Links = snapshot.data?.docs ?? [];
            return Column(children: [
              // Padding(
              //   padding: const EdgeInsets.all(10).w,
              //   child: TextField(
              //     controller: searchController,
              //     onChanged: (value) {
              //       setState(() {
              //         searchName = value;
              //       });
              //     },
              //     decoration: InputDecoration(
              //         prefixIcon: Icon(Icons.search),
              //         suffixIcon: IconButton(
              //             onPressed: () {
              //               setState(() {
              //                 searchController.delete();
              //               });
              //             },
              //             icon: Icon(Icons.clear)),
              //         contentPadding: EdgeInsets.all(10).w,
              //         isDense: true,
              //         hintText: 'Search Vedios',
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10.w))),
              //   ),
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount: Links.length,
                  itemBuilder: (context, index) {
                    var link = Links[index].data() as Map<String, dynamic>;
                    return InkWell(
                      onTap: () {
                        String youtubeLink = link['url'];
                        print(youtubeLink);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Vedioplayer(vedioId: youtubeLink);
                          },
                        ));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20)
                                .r,
                        child: Container(
                          height: 100.h,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 5.0,
                                    offset: const Offset(0.0, 3.0)),
                              ],
                              borderRadius: BorderRadius.circular(10).r,
                              color: Colors.cyan[100]),
                          child: Center(
                            child: ListTile(
                              leading: Image.network(
                                YoutubePlayer.getThumbnail(
                                  videoId: Links[index]['url'],
                                ),
                                // fit: BoxFit.cover,
                              ),
                              title: Text(Links[index]['course']),
                              subtitle: Text('More about Courses'),
                              // trailing: IconButton(
                              //   onPressed: () {
                              //     FirebaseFirestore.instance
                              //         .collection('FirstyearVediourl')
                              //         .doc(Links[index].id)
                              //         .delete();
                              //   },
                              //   icon: Icon(Icons.delete),
                              // ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ]);
          }),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate(this.links);
  final links;

  List<String> searchTerms = [];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }
}
