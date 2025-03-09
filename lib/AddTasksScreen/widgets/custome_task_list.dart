import 'package:flutter/material.dart';
import 'package:graduation_project/AddTasksScreen/model/task_provider.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, taskProvider, child) {
        if (taskProvider.tasks.isEmpty) {
          return Center(child: Text('No Tasks Yet'));
        }

        return ListView.builder(
          itemCount: taskProvider.tasks.length,
          itemBuilder: (context, index) {
            final task = taskProvider.tasks[index];
            return Dismissible(
              key: Key(task['id'].toString()),
              background: Container(color: Colors.red),
              onDismissed: (direction) {
                Provider.of<TasksProvider>(context, listen: false)
                    .deleteTask(task['id']);
              },
              child: ListTile(
                title: Text(task['title']),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    Provider.of<TasksProvider>(context, listen: false)
                        .deleteTask(task['id']);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
