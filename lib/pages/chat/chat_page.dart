import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_test/message_item_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _smsController = TextEditingController();
  IO.Socket? socket;

  sentMessage(String message) {
    Map<String, dynamic> jsonObject = {
      'message': message,
      'sentByMe': socket?.id,
    };
    socket?.emit('message', jsonObject);
  }

  socketListener() {
    socket?.on('receive', (data) {
      print(data);
    });
  }

  @override
  void initState() {
    super.initState();
    socket = IO.io(
      'http://localhost:3000',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );
    socket?.connect();
    socketListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(5),
                  child: MessageItemWidget(sentByMe: false),
                );
              },
            ),
          ),
          TextField(
            controller: _smsController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  if (_smsController.text.toString() != '') {
                    sentMessage(_smsController.text.toString());
                    _smsController.text = '';
                  }
                },
                icon: const Icon(Icons.send),
              ),
              hintText: 'type message',
            ),
          ),
        ],
      ),
    );
  }
}
