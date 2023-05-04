import 'package:flash_chat/app/components/messages/send_message.dart';
import 'package:flash_chat/app/components/messages/stream_message.dart';
import 'package:flash_chat/app/data/models/chat/chat_model.dart';
import 'package:flash_chat/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  ChatView({Key? key}) : super(key: key);
  ChatModel _chatModel = ChatModel();
  TextEditingController _textEditingController = TextEditingController();
  SignupController signupController =
      Get.put<SignupController>(SignupController());
  ChatController _chatController = Get.put<ChatController>(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            ),
            SizedBox(
              width: 20,
            ),
            Text(signupController.name.value),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StreamMessage(streamUser: controller.streamMessage()),
          SendMessage(
            controller.textController,
            onPressed: () async => controller.sendMessage(),
          )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.8,
          //       child: TextField(

          //         onChanged: (value) {
          //           _chatController.message.value = value;
          //         },
          //         decoration: InputDecoration(
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         _chatController.addChat();
          //         FocusManager.instance.primaryFocus?.unfocus();
          //       },
          //       child: Container(
          //         height: 50,
          //         width: 50,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(100),
          //           color: Colors.blue,
          //         ),
          //         child: Icon(
          //           Icons.send,
          //           color: Colors.black,
          //           size: 30,
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
