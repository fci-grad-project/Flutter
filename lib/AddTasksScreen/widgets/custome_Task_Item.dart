import 'package:flutter/material.dart';
import 'package:graduation_project/AddTasksScreen/model/task_provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  final Map<String, dynamic> task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TasksProvider>(context);
    final isSelected = tasksProvider.selectedTasks.contains(task['id']);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        onTap: () => tasksProvider.toggleSelection(task['id']),
        borderRadius: BorderRadius.circular(16),
        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                value: isSelected,
                activeColor: Colors.blue,
                onChanged: (value) => tasksProvider.toggleSelection(task['id']),
              ),
              Expanded(
                child: Text(
                  task['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.grey : Colors.black87,
                    decoration: isSelected ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Iconsax.trash, color: Colors.redAccent, size: 22),
                onPressed: () => tasksProvider.deleteTask(task['id']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
