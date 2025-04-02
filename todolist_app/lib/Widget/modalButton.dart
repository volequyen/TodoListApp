import 'package:flutter/material.dart';

class modalButton extends StatelessWidget {
  const modalButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,         
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),            
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Your task',
                border: OutlineInputBorder(),
                
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(             
              width: 120,
              height: 50,
              child: ElevatedButton(
                onPressed: (){},
                child: Text('End task')),
            ),
          ],
        ),
      ),
    );
  }
}
