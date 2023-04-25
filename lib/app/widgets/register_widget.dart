import 'package:flash_chat/app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({super.key, this.text, this.onpress});
  void Function()? onpress;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.blueB8,
        ),
        width: MediaQuery.of(context).size.width * 0.93,
        height: MediaQuery.of(context).size.height * 0.073,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
