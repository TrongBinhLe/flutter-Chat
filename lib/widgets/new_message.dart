import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() {
    // TODO: implement createState
    return _NewMessageState();
  }
}

class _NewMessageState extends State<NewMessage> {
  var _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _messageController.text;
    if (enteredMessage.trim().isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus();
    _messageController.clear();

    // send to Firebase
    final user = FirebaseAuth.instance.currentUser!;

    //-Get data of the userID
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    // Send
    FirebaseFirestore.instance.collection('chat').add({
      'text': _messageController.text,
      'createAt': Timestamp.now(),
      'userId': user.uid,
      'userName': userData.data()!['username'],
      'userImage': userData.data()!['image_url'],
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration:
                  const InputDecoration(labelText: 'Send a message ...'),
            ),
          ),
          IconButton(
            onPressed: _submitMessage,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
