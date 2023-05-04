import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  const SendMessage(this.textController, {super.key, this.onPressed});

  final TextEditingController textController;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.red, width: 2)),
      ),
      child: Row(
        children: [
          // const SizedBox(width: 20),
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Type your message here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
