import 'package:flutter/material.dart';
import 'package:graduation_project/AddTasksScreen/model/task_provider.dart';
import 'package:graduation_project/AddTasksScreen/widgets/custome_task_input_field.dart';
import 'package:graduation_project/AddTasksScreen/widgets/custome_task_item.dart';
import 'package:graduation_project/AddTasksScreen/widgets/custome_task_actions.dart';
import 'package:graduation_project/core/utils/app_colors.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TasksProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Tasks',
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          TaskInputField(), // ✅ حقل الإدخال بعد التحسين
          TaskActions(), // ✅ أزرار التحكم
          Expanded(
            child: tasksProvider.tasks.isEmpty
                ? Center(
                    child: Text(
                      "No Tasks Yet",
                      style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    itemCount: tasksProvider.tasks.length,
                    itemBuilder: (context, index) {
                      return TaskItem(task: tasksProvider.tasks[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
