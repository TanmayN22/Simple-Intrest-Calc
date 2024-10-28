// ignore: file_names
import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> tasks = [];

  void _addTask() {
  TextEditingController controller = TextEditingController();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('New Task'),
      content: TextField(controller: controller),
      actions: [
        MaterialButton(
          child: Text('Add'),
          onPressed: () {
            if(controller.text.isNotEmpty) {
              setState(() {
                tasks.add(controller.text);
                controller.clear();
              });
            }
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todo List')),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(tasks[index]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addTask(),
          child: const Icon(Icons.add),
        ));
  }
}
