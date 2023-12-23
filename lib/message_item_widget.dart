import 'package:flutter/material.dart';

class MessageItemWidget extends StatelessWidget {
  final bool sentByMe;
  const MessageItemWidget({super.key, required this.sentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          sentByMe == true ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        color: sentByMe == true ? Colors.blueAccent : Colors.green,
        child: const Text(
          'Hello',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
