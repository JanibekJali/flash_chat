import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            scrollable: true,
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Stack(
                  children: <Widget>[
                    Image.network(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        fit: BoxFit.cover),
                    Positioned(
                      top: 0,
                      child: Container(
                        color: Colors.grey.withOpacity(0.4),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Baburzhan',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
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
