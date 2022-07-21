import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore
            .instance.collection('chats').doc('9Mf7nlq69zlyN9C5SNyH').collection('messages').snapshots(),
        builder: (ctx, AsyncSnapshot streamSnapShot) {
        if(streamSnapShot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
          return ListView.builder(
            itemCount: streamSnapShot.data.docs.length,
            itemBuilder: (ctx, index) =>
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(streamSnapShot.data.docs[index]['text']),
                ),
          );
        },),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance.collection('chats/9Mf7nlq69zlyN9C5SNyH/messages').add({
            'text': 'This was added by click the button'
          });
        },
      ),
    );
  }
}