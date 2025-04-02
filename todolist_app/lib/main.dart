import 'package:flutter/material.dart';
import 'package:todolist_app/Widget/cardBody.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Center(
        child: Text(
          'ToDoList',
          style: TextStyle(fontSize: 25)
          ),
      ),
      backgroundColor: Colors.pinkAccent,
     ),
     body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          CardBody(),
          CardBody(),
          CardBody(),
          CardBody(),
          CardBody(),            
        ],
      ),
     ),
     floatingActionButton: FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.add, size: 40, color: Colors.pinkAccent),
      backgroundColor: Colors.white,
      ),
    );
  }
}
