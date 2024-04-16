import 'package:flutter/material.dart';
import 'package:todoapplication/presentation/Module/todo_module.dart';
import 'package:todoapplication/presentation/Screens/add_todo.dart';
import 'package:todoapplication/presentation/Screens/edit_todo_screen.dart';
import 'package:todoapplication/presentation/Widgets/appbar_widget.dart';
import 'package:todoapplication/presentation/Widgets/background_widget.dart';

class todoScreen extends StatefulWidget {
  const todoScreen({super.key});

  @override
  State<todoScreen> createState() => _todoScreenState();
}

class _todoScreenState extends State<todoScreen> {
  List<todo> Todo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: backgroundWidget(
        child: Visibility(
          visible: Todo.isNotEmpty,
          replacement: const Center(
            child: Text(
              "Your List Is Empty",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView.builder(
              itemCount: Todo.length,
              itemBuilder: (context, index) {
                return todoListCard(index);
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: _onTabTodoAddFAB,
        child: const Icon(Icons.add),
      ),
    );
  }

  Card todoListCard(int index) {
    return Card(
      child: ListTile(
        title: Text(Todo[index].title),
        subtitle: Text(Todo[index].description),
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: () => _onTabTodoEdit(index),
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () => showDeleteConfirmationDialog(index),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTabTodoAddFAB() async {
    final todo? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const addtodo(),
      ),
    );
    if (result != null) {
      Todo.insert(0, result);
      setState(() {});
    }
  }


  Future<void> _onTabTodoEdit(int index) async {
    final todo? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => editTodoScreen(
          Todo: Todo[index],
        ),
      ),
    );
    if (result != null) {
      Todo[index] = result;
      setState(() {});
    }
  }

  void showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Todo'),
          content: const Text('Are you sure want to delete!!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                removeTodo(index);
                Navigator.pop(context);
              },
              child: const Text(
                'Yes, Delete',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }

  void removeTodo(int index) {
    Todo.removeAt(index);
    setState(() {});
  }
}
