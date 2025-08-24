import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnbuddy/constants.dart';
import 'package:learnbuddy/view/shedule_screen/providers/shedule_screen_provider.dart';
import 'package:learnbuddy/view/shedule_screen/widgets/course_card.dart';

class SheduleScreen extends ConsumerStatefulWidget {
  const SheduleScreen({super.key});

  @override
  ConsumerState<SheduleScreen> createState() => _SheduleScreenState();
}

class _SheduleScreenState extends ConsumerState<SheduleScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    int _ltCounter = ref.watch(learningTeachingProvider);

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
                'My Classes',
                style: TextStyle(
                  fontSize: _width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              /// Tabs (Teachings / Learnings)
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          ref.read(learningTeachingProvider.notifier).state = 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: (_ltCounter == 0)
                                  ? primaryColor
                                  : secondaryColor,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Teachings',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: _width * 0.04,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          ref.read(learningTeachingProvider.notifier).state = 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color: (_ltCounter == 1)
                                  ? primaryColor
                                  : secondaryColor,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Learnings',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: _width * 0.04,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// Scrollable content wrapped in Expanded
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildSection("Ongoing", _width),
                      _buildSection("Upcoming", _width),
                      _buildSection("Completed", _width),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CourseCard(
          skillName: "Flutter Development",
          learnerName: "Arsh Kumar Mandal",
          sessionDuration: "2h 30m",
          imageUrl: "https://picsum.photos/400/200",
        ),
        const SizedBox(height: 5),
        CourseCard(
          skillName: "Flutter Development",
          learnerName: "Arsh Kumar Mandal",
          sessionDuration: "2h 30m",
          imageUrl: "https://picsum.photos/400/200",
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
