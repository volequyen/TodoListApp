import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
   CardBody({
    Key? key,
    required this.item,
    required this.handleDelete,
  }) : super(key: key); 
  var item;
  final Function(String) handleDelete;

  @override
  Widget build(BuildContext context) { 
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () async {
                  if (await confirm(context)) {
                    handleDelete(item.id);
                  }
                  return;
                },
              child: Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
