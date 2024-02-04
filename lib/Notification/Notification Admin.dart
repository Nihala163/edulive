import 'package:edulive/adminDash.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.subscribeToTopic('admin_topic');
  }

  void _sendMessage() {
    String message = _messageController.text.trim();

    if (message.isNotEmpty) {
      FirebaseFirestore.instance.collection('messages').add({
        'title': 'Admin',
        'body': message,
        'timestamp': FieldValue.serverTimestamp(),
      });

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(leading: IconButton(onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
       return AdminDash();
     },));

     }, icon: Icon(Icons.arrow_back_ios_new))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [SizedBox(height: 100),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Enter Message',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: _sendMessage,
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}
