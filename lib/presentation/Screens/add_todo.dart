import 'package:flutter/material.dart';
import 'package:todoapplication/presentation/Module/todo_module.dart';
import 'package:todoapplication/presentation/Widgets/appbar_widget.dart';
import 'package:todoapplication/presentation/Widgets/background_widget.dart';

class addtodo extends StatefulWidget {
  const addtodo({super.key});

  @override
  State<addtodo> createState() => _addtodoState();
}

class _addtodoState extends State<addtodo> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: backgroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Form(
              key: _fromKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (String? value) {
                      // without using third variable
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter the Title';
                      } else {
                        return null;
                      }
                    },
                    controller: _titleTEController,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      // without using third variable
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter the Description';
                      } else {
                        return null;
                      }
                    },
                    controller: _descriptionTEController,
                    maxLength: 500,
                    maxLines: 7,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_fromKey.currentState!.validate()) {
                        todo Todo = todo(_titleTEController.text.trim(),
                            _descriptionTEController.text.trim());
                        Navigator.pop(context, Todo);
                      }
                    },
                    child: const Text('Submit'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleTEController.dispose();
    _descriptionTEController.dispose();
  }
}
