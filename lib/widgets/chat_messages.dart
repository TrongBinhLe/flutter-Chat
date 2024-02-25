import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createAt', descending: false)
          .snapshots(),
      builder: (context, chatSnapshots) {
        if (chatSnapshots == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!chatSnapshots.hasData) {
          return const Center(
            child: Text('No messages found.'),
          );
        }

        final loadedMessages = chatSnapshots.data!.docs;

        return ListView.builder(
          itemBuilder: (context, index) =>
              Text(loadedMessages[index].data()['text']),
        );
      },
    );
  }
}
