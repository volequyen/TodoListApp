import 'package:flutter/material.dart';
import 'package:todolist_app/Modal/item.dart';
import 'package:todolist_app/Widget/CardBody.dart';
import 'package:todolist_app/Widget/ModalButton.dart';
import 'package:todolist_app/serviecs/item_service.dart';

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

  final ItemService  _itemservice = ItemService();
    void initState() {
    super.initState();
    _loadItemsFromDB(); // Load dữ liệu khi app khởi động
  }

  Future<void> _loadItemsFromDB() async {
    List<DataItem> loadedItems = await _itemservice.readAllItem();
    setState(() {
      widget.items.addAll(loadedItems);
    });
  }

   void handleAddTask(String name) async{
    final newItem = DataItem(id: DateTime.now().toString(), name: name);
    await _itemservice.saveItem(newItem);
    setState((){
      widget.items.add(newItem);
    });
  }

  void handleDeleteTask(String id)async{
    await _itemservice.deleteItem(id);
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
      backgroundColor: Colors.purpleAccent,
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

