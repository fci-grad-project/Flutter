import 'package:flutter/material.dart';
import 'package:graduation_project/AddTasksScreen/model/task_provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

class TaskActions extends StatelessWidget {
  const TaskActions({super.key});

  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TasksProvider>(context);
    // final hasSelectedTasks = tasksProvider.selectedTasks.isNotEmpty;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                icon: Iconsax.tick_circle,
                label: "Select All",

                color: Colors.green,
                onPressed: tasksProvider.selectAll,
              ),
              _buildActionButton(
                icon: Iconsax.trash,
                label: "Delete All",
                color: Colors.red,
                onPressed: tasksProvider.deleteAllTasks,
              ),
            ],
          ),
        ),

      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 20),
      label: Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}