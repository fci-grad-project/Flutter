import 'package:flutter/material.dart';
import 'package:graduation_project/AddTasksScreen/model/task_provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

class TaskInputField extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  TaskInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: ' Add New Task',
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                filled: true,
                fillColor: Colors.grey.shade300,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed: () {
              if (_taskController.text.isNotEmpty) {
                Provider.of<TasksProvider>(context, listen: false)
                    .addTask(_taskController.text);
                _taskController.clear();
              }
            },
            icon: Icon(Iconsax.add, color: Colors.white, size: 22),
            label: Text("Add", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
