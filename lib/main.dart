import 'package:flutter/material.dart';
import 'package:todolist_app/Modal/item.dart';
import 'package:todolist_app/Widget/CardBody.dart';
import 'package:todolist_app/Widget/ModalButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItem> items =  [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(items: items),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final List<DataItem> items; 
  HomeScreen({Key? key,required this.items}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   void handleAddTask(String name){
    final newItem = DataItem(id: DateTime.now().toString(), name: name);
    setState((){
      widget.items.add(newItem);
    });
  }

  void handleDeleteTask(String id){
    setState(() {
       widget.items.removeWhere((item) => item.id == id);
    });   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Center(
        child: Text(
          'To do List',
          style: TextStyle(fontSize: 25, color: Colors.white)
          ),
      ),
      backgroundColor: Colors.pinkAccent,
     ),
     body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: widget.items.map((item) => CardBody(item: item, handleDelete: handleDeleteTask)).toList(),
      ),
     ),
     floatingActionButton: FloatingActionButton(
      onPressed: (){
        showModalBottomSheet(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          isScrollControlled: true,
          context: context, 
          builder: (BuildContext context){
          return ModalButton(addTask: handleAddTask);

        });
      },
      child: Icon(Icons.add, size: 40, color: Colors.pinkAccent),
      backgroundColor: Colors.white,
      ),
    );
  }
}

