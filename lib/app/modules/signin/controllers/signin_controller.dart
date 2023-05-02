import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/app/modules/chat/views/chat_view.dart';
import 'package:flash_chat/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  // Rx<TextEditingController> _controllerEmail = TextEditingController().obs;
  // Rx<TextEditingController> _controllerPassword = TextEditingController().obs;
  // Rx<TextEditingController> get controllerEmail => _controllerEmail;
  // Rx<TextEditingController> get controllerPassword => _controllerPassword;

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      Get.to(HomeView());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
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
