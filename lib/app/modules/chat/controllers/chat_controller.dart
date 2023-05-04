import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/app/data/models/chat/chat_model.dart';
import 'package:flash_chat/app/modules/chat/services/chat_service.dart';
import 'package:flash_chat/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textController = TextEditingController();
  ChatModel chatModel = ChatModel();
  RxString message = ''.obs;
  SignupController _signupController = Get.find();
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  Future<void> sendMessage() async {
    final sms = textController.text.trim();
    if (sms != '') {
      await ChatService.sendMessage(sms);
      textController.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamMessage() {
    return ChatService.getStreamMessages();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
