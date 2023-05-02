import 'package:flash_chat/app/modules/chat/views/chat_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController _homeController = Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        title: const Text('Chats'),
        centerTitle: true,
      ),
      body: Center(
        child: Expanded(
          child: ListView.builder(
            itemExtent: 90,
            itemCount: 5,
            itemBuilder: (context, index) => Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.to(ChatView());
                  },
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _homeController.showMyDialog(context);
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Baburzhan',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              'Salam',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      Text(
                        '15:45',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
