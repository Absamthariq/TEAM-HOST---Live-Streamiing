import 'package:chatbox/chatbox.dart';
import 'package:flutter/material.dart';
import 'package:streaming_app/Constants/constants.dart';

class DirectMessage extends StatelessWidget {
  const DirectMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Row(
          children: const [
            CircleAvatar(),
            SizedBox(width: 5),
            Text('Person Name'),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: const [
              ChatBox(
                message: "Text message here",
                recieved: true,
                chatBoxColor: primaryThemeColor,
                textColor: Colors.white,
                time: "1:15",
              ),
              ChatBox(
                message: "Text message here",
                recieved: true,
                chatBoxColor: primaryThemeColor,
                textColor: Colors.white,
                time: "1:15",
              ),
              ChatBox(
                message: "Text message here",
                recieved: false,
                chatBoxColor: primaryThemeColor,
                textColor: Colors.white,
                time: "1:15",
              ),
              ChatBox(
                message: "Text message here",
                recieved: true,
                chatBoxColor: primaryThemeColor,
                textColor: Colors.white,
                time: "1:15",
              ),
              ChatBox(
                message: "Text message here",
                recieved: true,
                chatBoxColor: primaryThemeColor,
                textColor: Colors.white,
                time: "1:15",
              ),
              ChatBox(
                message: "Text message here",
                recieved: true,
                chatBoxColor: primaryThemeColor,
                textColor: Colors.white,
                time: "1:15",
              ),
              ChatBox(
                message: "Text message here",
                recieved: false,
                chatBoxColor: primaryThemeColor,
                textColor: Colors.white,
                time: "1:15",
              ),
              const ChatBox(
                message: "Text message here",
                recieved: true,
                chatBoxColor: primaryThemeColor,
                textColor: Colors.white,
                time: "1:15",
              ),
              const ChatBox(
                message: "Text message here",
                recieved: true,
                chatBoxColor: primaryThemeColor,
                textColor: Colors.white,
                time: "1:15",
              ),
              const ChatBox(
                message: "Text message here",
                recieved: true,
                chatBoxColor: primaryThemeColor,
                textColor: Colors.white,
                time: "1:15",
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.grey[350],
                      hintText: 'Type Something',
                      filled: true),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
