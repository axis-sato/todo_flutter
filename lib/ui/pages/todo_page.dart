import 'package:flutter/material.dart';
import 'package:todo_flutter/ui/pages/todo_list_page.dart';

class TodoPage extends StatelessWidget {
  final Todo _todo;

  const TodoPage({Key? key, required Todo todo})
      : _todo = todo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO ${_todo.id}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(_todo.title),
      ),
    );
  }
}
