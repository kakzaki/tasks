import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/category.dart';

class TaskListScreen extends StatefulWidget {
  Category category;
  TaskListScreen(this.category);

  @override
  State<StatefulWidget> createState() {
    return _TaskListScreenState(category);
  }
}

class _TaskListScreenState extends State<TaskListScreen> {
  Category category;
  List<Task> tasks = [];

  TextEditingController controller = new TextEditingController();

  _TaskListScreenState(this.category) {
    this.tasks = category.tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop(category);
            }
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: _buildTaskItem
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("New Task"),
                content: TextField(
                  controller: controller,
                  autofocus: true
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      controller.clear();
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("Add"),
                    onPressed: () {
                      setState(() {
                        final task = Task(title: controller.value.text);
                        tasks.add(task);
                        controller.clear();
                        Navigator.of(context).pop(task);
                      });
                    },
                  )
                ],
              );
            }
          );
        },
      ),
    );
  }

  Widget _buildTaskItem(BuildContext context, int index) {
    final task = tasks[index];

    return ListTile(
      title: Text(task.title),
      leading: Checkbox(
        value: task.done,
        onChanged: (bool checked) {
          setState(() {
            task.done = checked;
          });
        },
      ),
      trailing: FlatButton(
        child: Icon(Icons.clear, color: Colors.red),
        onPressed: () {
          setState(() {
            tasks.remove(task);
          });
        },
      ),
    );
  }
}
