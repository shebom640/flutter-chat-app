import 'package:chatapp/widgets/chat/messages.dart';
import 'package:chatapp/widgets/chat/new_message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
        actions: <Widget>[
          DropdownButton(
            icon: Padding(
              padding: EdgeInsets.only(right: 8),
              child: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: const [
                      Icon(Icons.exit_to_app_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Log Out")
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Messages()
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
