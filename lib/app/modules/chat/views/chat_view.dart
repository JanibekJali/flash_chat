import 'package:flash_chat/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends StatelessWidget {
  ChatView({Key? key}) : super(key: key);
  SignupController signupController =
      Get.put<SignupController>(SignupController());
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
            Text('Ali'),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffB5E2E1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Color(0xffB5E2E1),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello From Ali',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('12:00'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffB5E2E1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Color(0xffB5E2E1),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi, It is me!',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('12:00'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.send,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
