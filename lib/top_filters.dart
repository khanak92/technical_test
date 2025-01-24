import 'package:flutter/material.dart';

class TopFilters extends StatefulWidget {
  final Function(String) onFilterSelected;
  const TopFilters({Key? key, required this.onFilterSelected})
      : super(key: key);

  @override
  _TopFiltersState createState() => _TopFiltersState();
}

class _TopFiltersState extends State<TopFilters> {
  String selectedFilter = 'All';

  final List<String> categories = ['All', 'Sports', 'Food', 'Kids', 'Creative'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          bool isSelected = selectedFilter == category;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              side: BorderSide.none,
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  selectedFilter = category;
                });
                widget.onFilterSelected(category);
              },
              selectedColor: Colors.purple[300],
              backgroundColor: Colors.purple[50],
              labelStyle:
                  TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          );
        }).toList(),
      ),
    );
  }
}
