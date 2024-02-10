import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white, // Set appbar color to blue
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/icons/chatbot_logo.png'),
              backgroundColor: Colors.white,
              radius: 18,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jaankar Sarthi',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF007CC2),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Making Laws Easy!',
                  style: TextStyle(fontSize: 16, color: Color(0xFF007CC2)),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ChatBody(),
    );
  }
}

class ChatBody extends StatefulWidget {
  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_home.png'),
          opacity: 0.35,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10), // Added horizontal padding
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Question',
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: Color(0xFF007CC2),
                          size: 25,
                        ),
                        onPressed: () {
                          String messageText = _messageController.text;
                          _sendMessage(messageText);
                        },
                      ),
                      border: OutlineInputBorder(
                        // Use OutlineInputBorder to achieve rounded rectangle
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor:
                          Colors.blue[100], // Set faint blue background color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String messageText) {
    if (messageText.isNotEmpty) {
      setState(() {
        _messages.add(
          ChatMessage(
            isUser: true,
            message: messageText,
          ),
        );
        // Here you would handle the response from your chat manager
        // For now, let's simulate a response after 1 second
        Future.delayed(Duration(seconds: 1), () {
          _messages.add(
            ChatMessage(
              isUser: false,
              message: 'This is a response from the chatbot.',
            ),
          );
        });
        _messageController.clear();
      });
    }
  }
}

class ChatMessage extends StatelessWidget {
  final bool isUser;
  final String message;

  const ChatMessage({Key? key, required this.isUser, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: isUser
                  ? [
                      Colors.blue,
                      Colors.blue.shade300,
                    ]
                  : [
                      Colors.teal.shade100,
                      Colors.teal.shade200,
                      Colors.teal.shade300,
                    ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
