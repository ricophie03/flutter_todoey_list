import 'package:flutter/material.dart';
import 'package:flutter_todoey_list/models/task.dart';
import 'package:flutter_todoey_list/widgets/list_tile_item.dart';
import 'package:flutter_todoey_list/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        //taskData = Provider.of<TaskData>(context)
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return GestureDetector(
              onLongPress: () {
                taskData.deleteTask(index);
              },
              child: ListTileItems(
                  taskText: task.name,
                  isChecked: task.isChecked,
                  toogleCheckBox: (newValue) {
                    taskData.updateTask(task);
                  }),
            );
          },
          itemCount:
              taskData.taskCount, // membuat listView sesuai panjang tasks
        );
      },
    );
  }
}
