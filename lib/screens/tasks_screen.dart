import 'package:flutter/material.dart';
import 'package:flutter_todoey_list/widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:flutter_todoey_list/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 3.0,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true, // membuat modal full layar
                context: context, // context adalah tampilan build yang dilihat
                // builder ingin function yang mengembalikan buildContext(context yang mengembalikan sebuah tampilan)
                builder: (context) => SingleChildScrollView(
                      //A box in which a single widget can be scrolled.
                      child: Container(
                        child: AddTaskScreen(
                          callBack: (newValue) {
                            // setState(() {
                            //   tasks.add(Task(name: newValue));
                            // });
                            Provider.of<TaskData>(context, listen: false)
                                .addTask(newValue!);
                            Navigator.pop(context);
                          },
                        ),
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                      ),
                    ));
          },
          backgroundColor: Color(0xFF5AC1FC),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        backgroundColor: Color(0xFF5AC1FC),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                child: Consumer<TaskData>(
                  builder: (context, taskData, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30.0,
                          child: Icon(
                            Icons.list,
                            color: Color(0xFF5AC1FC),
                            size: 40.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Todoey',
                          style: TextStyle(
                              fontSize: 60.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '${taskData.taskCount} Tasks',
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  child: TaskList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
