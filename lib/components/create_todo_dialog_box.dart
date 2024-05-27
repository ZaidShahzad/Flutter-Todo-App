import 'package:flutter/material.dart';
import 'package:flutterbeginnerapp/components/button.dart';

class CreateTodoDialogBox extends StatelessWidget {
  final TextEditingController taskNameInputController;
  final Function() saveButtonOnPressed;
  final Function() cancelButtonOnPressed;

  const CreateTodoDialogBox(
      {super.key,
      required this.taskNameInputController,
      required this.saveButtonOnPressed,
      required this.cancelButtonOnPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Get user input for the task they want to add
            TextField(
              controller: taskNameInputController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter new task name."),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Save Button
                Button(
                    buttonName: "Save",
                    color: Colors.green,
                    onPressed: saveButtonOnPressed),
                // Horizontal gap between buttons
                const SizedBox(width: 8),
                // Cancel Button
                Button(
                    buttonName: "Cancel",
                    color: Colors.redAccent,
                    onPressed: cancelButtonOnPressed)
              ],
            )
          ],
        ),
      ),
    );
  }
}
