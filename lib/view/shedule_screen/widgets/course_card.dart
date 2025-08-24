import 'package:flutter/material.dart';

/// Course Card Widget
/// Shows:
///  - Thumbnail image
///  - Skill name (title)
///  - Learner name
///  - Session duration
class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.skillName,
    required this.learnerName,
    required this.sessionDuration,
    required this.imageUrl,
    this.onTap,
  });

  final String skillName;
  final String learnerName;
  final String sessionDuration;
  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),

            // Info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skillName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          learnerName,
                          style: const TextStyle(color: Colors.black87),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        sessionDuration,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Demo Page for CourseCard
class CourseCardDemoPage extends StatelessWidget {
  const CourseCardDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Course Cards")),
      body: ListView(
        children: const [
          CourseCard(
            skillName: "Flutter Development",
            learnerName: "Arsh Kumar Mandal",
            sessionDuration: "2h 30m",
            imageUrl: "https://picsum.photos/400/200",
          ),
          CourseCard(
            skillName: "Data Structures",
            learnerName: "John Doe",
            sessionDuration: "1h 15m",
            imageUrl: "https://picsum.photos/401/200",
          ),
        ],
      ),
    );
  }
}
