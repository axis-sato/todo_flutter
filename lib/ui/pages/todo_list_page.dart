import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO一覧'),
      ),
      body: const Center(
        child: Text('todo list'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '追加',
        child: const Icon(Icons.add),
      ),
    );
  }
}
