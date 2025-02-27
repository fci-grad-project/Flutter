import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors.dart';

class CustomeFiltersSection extends StatefulWidget {
  final ValueChanged<List<String>> onFilterChanged;

  const CustomeFiltersSection({super.key, required this.onFilterChanged});

  @override
  _CustomeFiltersSectionState createState() => _CustomeFiltersSectionState();
}

class _CustomeFiltersSectionState extends State<CustomeFiltersSection> {
  final Set<String> selectedFilters = {};
  final List<String> filters = [
    'Programming',
    'Design',
    'Marketing',
    'Business'
  ]; // Add your filter options here

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: filters.map((filter) {
            bool isSelected = selectedFilters.contains(filter);
            return FilterChip(
              label: Text(filter),
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  selected
                      ? selectedFilters.add(filter)
                      : selectedFilters.remove(filter);
                  widget
                      .onFilterChanged(selectedFilters.toList()); // تحديث القائمة
                });
              },
              backgroundColor: AppColors.primaryColor,
              labelStyle:
                  TextStyle(color: Colors.white , fontSize: 14, fontWeight: FontWeight.bold),
            );
          }).toList(),
        ),
      ),
    );
  }
}
