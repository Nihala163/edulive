// Import necessary packages
import 'package:flutter/material.dart';

import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  void shareApp() {
    Share.share(
        'Check out this Employability Skills Training App: https://www.kozhikode.directory/kmo-iti/i/1000');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back_ios)),
          title: Text('About App'),
        ),
        body: WebView(
          initialUrl: "https://developer.android.com/training/app-links",
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutApp(),
  ));
}
