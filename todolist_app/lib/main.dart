import 'package:flutter/material.dart';
import 'package:todolist_app/Modal/item.dart';
import 'package:todolist_app/Widget/cardBody.dart';
import 'package:todolist_app/Widget/modalButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  final List<DataItem> items =  [
    DataItem(id: '1', name:'Tập thể dục'),
    DataItem(id: '2', name:'Ăn sáng'),
    DataItem(id: '3', name:'Học tiếng Nhật'),
    DataItem(id: '4', name:'Học Flutter'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(items: items),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<DataItem> items; 
  HomeScreen({Key? key,required this.items}) : super(key: key);
  

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
        children: items.map((item) => CardBody(item: item)).toList(),
      ),
     ),
     floatingActionButton: FloatingActionButton(
      onPressed: (){
        showModalBottomSheet(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          isScrollControlled: true,
          context: context, 
          builder: (BuildContext context){
          return modalButton();

        });
      },
      child: Icon(Icons.add, size: 40, color: Colors.pinkAccent),
      backgroundColor: Colors.white,
      ),
    );
  }
}

