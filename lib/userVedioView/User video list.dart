import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edulive/Admin/Add%20video.dart';
import 'package:edulive/Admin/Video%20player.dart';
import 'package:edulive/addPdf/AddNote.dart';
import 'package:edulive/userVedioView/Video%20player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VedioListUser extends StatefulWidget {
  const VedioListUser({super.key});

  @override
  State<VedioListUser> createState() => _VedioListUserState();
}

class _VedioListUserState extends State<VedioListUser> {
  // var Links;
  // List user = [];
  List allResult = [];
  List resultList = [];
  var searchName = '';
  final TextEditingController searchController = TextEditingController();

  @override
  initState() {
    getClientStream();

    searchController.addListener(onSearchchanged);
    super.initState();
  }

  getClientStream() async {
    var data = await FirebaseFirestore.instance
        .collection('FirstyearVediourl')
        .orderBy('course')
        .get();

    setState(() {
      allResult = data.docs;
    });
    searchResultList();

    // user = allResult;
  }

  onSearchchanged() async {
    await searchResultList();
  }

  @override
  void dispose() {
    searchController.removeListener(onSearchchanged);
    searchController.dispose();
    super.dispose();
  }

  searchResultList() {
    var showResult = [];
    if (searchController.text != "") {
      for (var clientsnapshot in allResult) {
        var name = clientsnapshot['course'].toString().toLowerCase();
        if (name.contains(searchController.text.toLowerCase())) {
          showResult.add(clientsnapshot);
        }
      }
    } else {
      showResult = List.from(allResult);
    }
    setState(() {
      resultList = showResult;
    });
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(

            // leading: BackButton(color: Colors.white),
            // title: Text('Vedio List'),
            // titleTextStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
            backgroundColor: Colors.amberAccent,
            centerTitle: true,
            title: CupertinoSearchTextField(
              controller: searchController,
            )),
        body:
        resultList.isEmpty
            ? Center(
                child: Lottie.network(
                    'https://lottie.host/08fad6f8-46ea-4771-bcfb-9fc59cb9128a/A0vHdKzMT5.json',
                    height: 200.h,
                    width: 200.w),
              )
            : ListView.builder(
                itemCount: resultList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      String youtubeLink = resultList[index]['url'];
                      print(youtubeLink);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return VedioplayerUser(vedioId: youtubeLink);
                        },
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10)
                          .w,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        tileColor: Colors.indigo[900],
                        leading: Image.network(
                          YoutubePlayer.getThumbnail(
                            videoId: resultList[index]['url'],
                          ),
                          // fit: BoxFit.cover,
                        ),
                        title: Text(resultList[index]['course'],
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text('More about Courses',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  );
                },
              ));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate(this.Links);
  final Links;

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
    // matchQuery.add(Links[Index]['course']);
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
