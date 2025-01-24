import 'package:flutter/material.dart';
import 'package:technical_test/activity_card.dart';
import 'package:technical_test/custom_bottom_navigation.dart';
import 'package:technical_test/goal_card.dart';
import 'package:technical_test/top_filters.dart';

class ActivitiesScreen extends StatefulWidget {
  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  String selectedCategory = 'All';

  String _getMonthName(int month) {
    const monthNames = [
      'Jan',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month - 1];
  }

  final List<Map<String, dynamic>> activities = [
    {
      'title': 'Morning Yoga',
      'time': '07:00',
      'duration': '60 min',
      'location': 'Central Park',
      'spots': 10,
      'price': '5 £',
      'category': 'Sports',
      'dif': 'light',
    },
    {
      'title': 'Pizza Making',
      'time': '02:00',
      'duration': '60 min',
      'location': 'Pizza Place',
      'spots': 5,
      'price': '20 £',
      'category': 'Food',
      'dif': 'medium',
    },
    {
      'title': 'Beach Yoga',
      'time': '08:00',
      'duration': '45 min',
      'location': 'Basti Bazar',
      'spots': 8,
      'price': '15 £',
      'category': 'Creative',
      'dif': 'high',
    },
    {
      'title': 'Football',
      'time': '04:00',
      'duration': '30 min',
      'location': 'F9 ground',
      'spots': 15,
      'price': '10 £',
      'category': 'Kids',
      'dif': 'light',
    },
  ];

  List<Map<String, dynamic>> get filteredActivities {
    if (selectedCategory == 'All') return activities;
    return activities.where((a) => a['category'] == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    DateTime dt = DateTime.parse(DateTime.now().toString());
    String formattedDate =
        '${dt.day.toString().padLeft(2, '0')} ${_getMonthName(dt.month)} ${dt.year}';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          formattedDate,
          style: const TextStyle(fontSize: 16, color: Colors.black38),
        ),
        actions: const [
          Icon(Icons.notifications_none_outlined),
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'This week in Lahore',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          GoalCard(),
          TopFilters(
            onFilterSelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: filteredActivities.isEmpty
                  ? const Center(child: Text('No activities found'))
                  : ListView.builder(
                      itemCount: filteredActivities.length,
                      itemBuilder: (context, index) {
                        return ActivityCard(
                          activity: filteredActivities[index],
                          onJoin: () {
                            print(
                                'Joined ${filteredActivities[index]['title']}');
                          },
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
