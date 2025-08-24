import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:learnbuddy/view/chatting_screen/widgets/chat_user_card.dart';

class ChattListScreen extends ConsumerStatefulWidget {
  const ChattListScreen({super.key});

  @override
  ConsumerState<ChattListScreen> createState() => _ChattListScreenState();
}

class _ChattListScreenState extends ConsumerState<ChattListScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: _height * 0.05,
            bottom: _height * 0.08,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                'Chats',
                style: TextStyle(
                  fontSize: _width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return ChatCard(
                      avatarUrl: null,
                      name: 'Arsh Kumar Mandal',
                      lastMessage: 'See you at 6? 😊',
                      isOnline: false,
                      lastSeenText: '5 A.M',
                      unreadCount: 3,
                      onTap: () {
                        context.push('/chatscreen');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
