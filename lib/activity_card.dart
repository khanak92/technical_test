import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final Map<String, dynamic> activity;
  final Function onJoin;

  const ActivityCard({Key? key, required this.activity, required this.onJoin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cont;
    if (activity['dif'] == 'light') {
      cont = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.blue[50],
        ),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        child: const Text(
          'light',
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),
      );
    } else if (activity['dif'] == 'medium') {
      cont = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.purple[50],
        ),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        child: const Text(
          'medium',
          style: TextStyle(fontSize: 16, color: Colors.purple),
        ),
      );
    } else {
      cont = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.orange[50],
        ),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        child: const Text(
          'high',
          style: TextStyle(fontSize: 16, color: Colors.orange),
        ),
      );
    }

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${activity['time']} (${activity['duration']})'),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  activity['title'],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  activity['price'],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                Text(activity['location'])
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: Row(
                    children: [
                      const Icon(Icons.person_2_outlined),
                      Text(
                        '${activity['spots']} spots left',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                cont,
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('You are added in this acivity'),
                      ),
                    );
                  },
                  child: const Text(
                    'Join',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
