import 'package:flutter/material.dart';
import 'package:tasks/src/data/models/task_model.dart';

import 'item_list_tile.dart';

class GroupListTile extends StatefulWidget {
  GroupListTile({
    Key key,
    @required this.title,
    @required this.items,
    @required this.onChanged,
    @required this.whenOnTap
  }): assert(title != null),
      assert(items != null),
      assert(onChanged != null),
      assert(whenOnTap != null),
      super(key: key);

  final String title;
  final List<TaskModel> items;
  final ValueChanged<TaskModel> onChanged;
  final Function whenOnTap;

  @override
  State<GroupListTile> createState() => _GroupListTileState();
}

class _GroupListTileState extends State<GroupListTile> {
  String title;
  List<TaskModel> items;

  @override
  void initState() {
    super.initState();
    this.title = this.widget.title;
    this.items = this.widget.items;
  }

  @override
  void didUpdateWidget(GroupListTile oldWidget) {
    if (oldWidget.items.length != this.widget.items.length) {
      this.items = this.widget.items;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(this.context).copyWith(
        dividerColor: Colors.transparent
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(this.title),
        children: this.buildChildren()
      ),
    );
  }

  List<Widget> buildChildren() {
    List<Widget> children = <Widget>[];
    this.items.forEach((TaskModel task) {
      children.add(ItemListTile(
        task: task,
        onChanged: (bool checked) {
          task.done = checked;
          this.widget.onChanged(task);
        },
        whenOnTap: this.widget.whenOnTap
      ));
    });

    return children;
  }
}
