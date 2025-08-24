import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swipable_stack/swipable_stack.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SwipableStackController _controller = SwipableStackController();

  final List<Map<String, dynamic>> users = [
    {
      "name": "Arsh Kumar",
      "skills": ["Flutter", "Firebase", "UI/UX", "NodeJS"],
      "rating": 4.8,
      "bio":
          "Passionate Flutter dev building cross-platform apps kjbashb udubas ucubs bubuwb ubvuwu ubcuu 🚀",
      "image": "https://randomuser.me/api/portraits/men/32.jpg",
    },
    {
      "name": "Rohan Sharma",
      "skills": ["Java", "Spring Boot", "SQL"],
      "rating": 4.6,
      "bio": "Backend enthusiast, loves clean architecture 🏗️",
      "image": "https://randomuser.me/api/portraits/men/65.jpg",
    },
    {
      "name": "Sneha Patel",
      "skills": ["Python", "ML", "Data Science"],
      "rating": 4.9,
      "bio": "Turning data into insights 📊",
      "image": "https://randomuser.me/api/portraits/women/44.jpg",
    },
    {
      "name": "Aditi Singh",
      "skills": ["React", "Node.js", "MongoDB"],
      "rating": 4.7,
      "bio": "Full-stack dev, coffee lover ☕",
      "image": "https://randomuser.me/api/portraits/women/21.jpg",
    },
  ];

  final List<String> exampleSkills = [
    "Flutter",
    "Python",
    "React",
    "UI/UX",
    "Machine Learning",
    "SQL",
    "Firebase",
    "Data Science",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: height * 0.02,
            bottom: height * 0.1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Greeting + Profile Picture
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Arsh!',
                        style: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Welcome to LearnBuddy',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: width * 0.07,
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/12.jpg',
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.025),

              // 🔍 Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search skills, mentors, learners...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: height * 0.025),

              // Title
              Text(
                'Select your next Skill',
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.015),

              // Horizontal skills slider
              SizedBox(
                height: height * 0.05,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: exampleSkills.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return Chip(
                      label: Text(exampleSkills[index]),
                      backgroundColor: Colors.orange.shade100,
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.025),

              // Swipable Cards
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SwipableStack(
                    controller: _controller,
                    detectableSwipeDirections: const {
                      SwipeDirection.left,
                      SwipeDirection.right,
                    },
                    stackClipBehaviour: Clip.none,
                    onSwipeCompleted: (index, direction) {
                      final user = users[index % users.length];
                      if (direction == SwipeDirection.right) {
                        debugPrint("✅ Request sent to ${user['name']}");
                      } else if (direction == SwipeDirection.left) {
                        debugPrint("❌ Request rejected for ${user['name']}");
                      }
                    },
                    overlayBuilder: (context, properties) {
                      final direction = properties.direction;
                      if (direction == null) return const SizedBox();

                      final opacity = (properties.swipeProgress * 1.2).clamp(
                        0.0,
                        1.0,
                      );

                      return Align(
                        alignment: direction == SwipeDirection.right
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Container(
                          width: size.width * 0.75,
                          height: size.height * 0.55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: direction == SwipeDirection.right
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              end: direction == SwipeDirection.right
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              colors: direction == SwipeDirection.right
                                  ? [
                                      Colors.green.withOpacity(opacity),
                                      Colors.transparent,
                                    ]
                                  : [
                                      Colors.red.withOpacity(opacity),
                                      Colors.transparent,
                                    ],
                            ),
                          ),
                          child: Icon(
                            direction == SwipeDirection.right
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: direction == SwipeDirection.right
                                ? Colors.green.withOpacity(opacity)
                                : Colors.red.withOpacity(opacity),
                            size: 64,
                          ),
                        ),
                      );
                    },
                    builder: (context, properties) {
                      final user = users[properties.index % users.length];
                      final isTopCard = properties.stackIndex == 0;

                      return GestureDetector(
                        onTap: () {
                          debugPrint("👉 Open profile of ${user['name']}");
                        },
                        child: Transform.scale(
                          scale: isTopCard ? 1 : 0.95,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                              width: size.width * 0.8,
                              height: size.height * 0.55,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 246, 233),
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Profile Picture
                                  Expanded(
                                    flex: 6,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                      ),
                                      child: Image.network(
                                        user["image"],
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Center(
                                                  child: Icon(
                                                    Icons.person,
                                                    size: 60,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                      ),
                                    ),
                                  ),
                                  // Info Section
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 5,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Name + Rating
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                user["name"],
                                                style: TextStyle(
                                                  fontSize: width * 0.05,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.orange,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    user["rating"].toString(),
                                                    style: TextStyle(
                                                      fontSize: width * 0.04,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          // Skills as Chips
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: (user["skills"] as List)
                                                  .map(
                                                    (skill) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                            right: 8,
                                                          ),
                                                      child: Chip(
                                                        label: Text(skill),
                                                        backgroundColor: Colors
                                                            .orange
                                                            .shade100,
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),

                                          const SizedBox(height: 8),
                                          // Bio
                                          Text(
                                            user["bio"],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: width * 0.038,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
