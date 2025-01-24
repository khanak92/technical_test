import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.calendar_today_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.map_outlined),
                onPressed: () {},
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
              IconButton(
                icon: Icon(Icons.person_outline),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.star_border),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
