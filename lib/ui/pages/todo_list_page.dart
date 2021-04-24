import 'package:flutter/material.dart';
import 'package:todo_flutter/ui/pages/todo_page.dart';
import 'package:todo_flutter/utils/logger.dart';

class Todo {
  int id;
  String title;
  bool completed;

  Todo({required this.id, required this.title, required this.completed});
}

class TodoListPage extends StatelessWidget {
  final todoList = [
    Todo(id: 1, title: "foo", completed: true),
    Todo(id: 2, title: "bar", completed: false),
    Todo(id: 3, title: "hoge", completed: false),
    Todo(id: 4, title: "fuga", completed: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO一覧'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final todo = todoList[index];
          return Dismissible(
            key: Key(todo.id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(
                right: 10,
              ),
              color: Colors.red,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              _deleteTodo(todo);
            },
            child: ListTile(
              leading: Checkbox(
                value: todo.completed,
                onChanged: (value) {
                  _toggleTodo(todo);
                },
              ),
              title: Text(
                todo.title,
                style: todo.completed
                    ? const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey)
                    : null,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoPage(todo: todo),
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: 0.0,
        ),
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTitle = await showDialog<String>(
            context: context,
            builder: (context) {
              String title = "";
              return AlertDialog(
                title: const Text("TODO作成"),
                content: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      onChanged: (value) {
                        title = value.trim();
                      },
                    )),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(title);
                    },
                    child: const Text('作成'),
                  ),
                ],
              );
            },
          );

          if (newTitle != null && newTitle != "") _addTodo(newTitle);
        },
        tooltip: '追加',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTodo(String title) {
    logger.d("TODO作成 (title=$title)");
  }

  void _deleteTodo(Todo todo) {
    logger.d("${todo.title}を削除しました。");
  }

  void _toggleTodo(Todo todo) {
    logger.d("${todo.title}を完了/未完了を変更しました。");
  }
}
