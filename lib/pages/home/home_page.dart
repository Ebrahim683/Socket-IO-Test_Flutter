import 'package:flutter/material.dart';
import 'package:socket_io_test/data/model/chat/user/user_item_model.dart';
import 'package:socket_io_test/pages/chat/chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userItemList = <UserItemModel>[
    UserItemModel('Name', 'pic'),
    UserItemModel('Name', 'pic'),
    UserItemModel('Name', 'pic'),
    UserItemModel('Name', 'pic'),
    UserItemModel('Name', 'pic'),
    UserItemModel('Name', 'pic'),
    UserItemModel('Name', 'pic'),
    UserItemModel('Name', 'pic'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: userItemList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(userItemList[index].name.toString()),
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatPage(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
