import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbeginnerapp/components/create_todo_dialog_box.dart';
import 'package:flutterbeginnerapp/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController taskNameInputController = TextEditingController();

  List todoList = [
    ["Task #1", false],
    ["Task #2", true]
  ];

  void dismissCurrentWidget() {
    /*
      This function dismisses the current widget we're on.
      "Navigator.of()" describes what we're referring to
      "context" would be the current widget we're on.
        -> For example, if we're on the DialogBox Widget and you call this function, it will remove that widget from the screen (basically going back to the previous screen).
      "pop()" removes it from the screen like how you remove something from a list
    */

    Navigator.of(context).pop();
  }

  // bool? means that this value can possibly be null
  void checkBoxChanged(bool? value, int todoListIndex) {
    /*
      Anything that is in the "setState" function will trigger a UI re-draw.
      For example, if you updated a value (number) in the UI but did
      not put that code in the "setState" function, the value will
      be updated, but the UI will not reflect that update.
    */
    setState(() {
      bool currentTaskValue = todoList[todoListIndex][1];
      // Set it to the opposite of what the current value is.
      todoList[todoListIndex][1] = !currentTaskValue;
    });
  }

  void addTodoTask() {
    /*
      Anything that is in the "setState" function will trigger a UI re-draw.
      For example, if you updated a value (number) in the UI but did
      not put that code in the "setState" function, the value will
      be updated, but the UI will not reflect that update.
    */
    setState(() {
      String taskNameFromTextInput = taskNameInputController.text;
      todoList.add([taskNameFromTextInput, false]);
      dismissCurrentWidget();
    });
  }

  void deleteTodoTask(BuildContext context, int todoListIndex) {
    /*
      Anything that is in the "setState" function will trigger a UI re-draw.
      For example, if you updated a value (number) in the UI but did
      not put that code in the "setState" function, the value will
      be updated, but the UI will not reflect that update.
    */
    setState(() {
      todoList.removeAt(todoListIndex);
    });
  }

  void openCreateNewTaskDialog() {
    taskNameInputController.clear();
    showDialog(
        // Context is from parent class State<HomePage> (don't worry too much about it)
        context: context,
        builder: (context) {
          return CreateTodoDialogBox(
            taskNameInputController: taskNameInputController,
            saveButtonOnPressed: addTodoTask,
            cancelButtonOnPressed: () {
              dismissCurrentWidget();
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Todo App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCreateNewTaskDialog,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (checkboxChangedUpdatedValue) =>
                  checkBoxChanged(checkboxChangedUpdatedValue, index),
              deleteTaskFunction: (context) => deleteTodoTask(context, index),
            );
          }),
    );
  }
}
