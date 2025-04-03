import 'package:flutter/material.dart';

class ModalButton extends StatelessWidget {
  final Function(String) addTask;
   TextEditingController controller = new TextEditingController();

  ModalButton({Key? key, required this.addTask}) : super(key: key);

  void handleOnClick(BuildContext context) {
    final name = controller.text;
    if (name.isNotEmpty) {
      addTask(name);
      controller.clear(); 
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Your task',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 120,
              height: 50,
              child: ElevatedButton(
                onPressed: () => handleOnClick(context),
                child: const Text('Add task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
