import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todoey_list/models/task.dart';
import 'package:flutter_todoey_list/db_helper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todoey_list/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  DbHelper dbHelper = DbHelper();
  String newTask = '';
  TextEditingController controller = TextEditingController();
  final void Function(String? addTask)? callBack;

  AddTaskScreen({this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                    color: Color(0xFF5AC1FC),
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700),
              ),
              TextField(
                autofocus: true,
                cursorHeight: 30.0,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newTask = value.toString();
                },
                style: TextStyle(fontSize: 24.0),
                //controller: controller,
              ),
              SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {
                  callBack!(newTask);
                  //controller.clear();
                },
                child: Text(
                  'New Task',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void addContact(Task object, BuildContext context) async {
  //   int result = await dbHelper.insert(object);
  //   if (result > 0) {
  //     Provider.of<TaskData>(context, listen: false).updateTaskListView();
  //   }
  // }
}
