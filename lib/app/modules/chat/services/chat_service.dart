import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/app/data/models/user/user_model.dart';
import 'package:flutter/material.dart';

class ChatService {
  static Future<void> sendMessage(String sms) async {
    final sender = FirebaseAuth.instance.currentUser;
    if (sender != null) {
      final _userModel = UserModel(
        // userName: sender.email!,
        sender: sender.email!,
        sms: sms,
        dateTime: DateTime.now(),
      );
      final _chats = FirebaseFirestore.instance.collection('chats');
      await _chats.add(_userModel.toJson());
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getStreamMessages() {
    return FirebaseFirestore.instance
        .collection('chats')
        .orderBy('dateTime', descending: true)
        .snapshots();
  }
}
