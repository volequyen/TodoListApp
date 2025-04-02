import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  const CardBody({Key? key}) : super(key: key); 

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
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tap the duc buoi sang',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.delete_outline,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
