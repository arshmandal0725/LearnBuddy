import 'package:flutter/material.dart';
import 'package:learnbuddy/view/chatting_screen/widgets/message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color(0xFFE24C00);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: primaryColor,

        titleSpacing: 0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/200"),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Alicia Keys", style: TextStyle(fontSize: 16)),
                Text(
                  "Online",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          // Chat list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: const [
                MessageBubble(
                  text: "Hey! How are you doing?",
                  isMe: false,
                  time: "10:42 AM",
                ),
                MessageBubble(
                  text: "I’m good, just working on the Flutter project.",
                  isMe: true,
                  time: "10:43 AM",
                ),
                MessageBubble(
                  text: "That’s great! Let’s catch up later tonight.",
                  isMe: false,
                  time: "10:44 AM",
                ),
                MessageBubble(
                  text: "Sure, sounds good! 😊",
                  isMe: true,
                  time: "10:45 AM",
                ),
              ],
            ),
          ),

          // Input area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.white,
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    color: Colors.grey[600],
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type a message...",
                        ),
                        minLines: 1,
                        maxLines: 4,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.attach_file),
                    color: Colors.grey[600],
                    onPressed: () {},
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE24C00),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
