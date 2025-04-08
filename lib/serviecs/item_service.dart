import 'package:flutter/material.dart';
import 'package:todolist_app/Modal/item.dart';
import 'package:todolist_app/reponsitories/Repository.dart';

class ItemService {
  late Repository _repository;

  ItemService(){
    _repository = Repository();
  }

  saveItem(DataItem item)async{
    return await _repository.insertData('tasks', item.itemMap());
  }

  Future<List<DataItem>> readAllItem() async {
  final data = await _repository.readData('tasks');
  return data.map((map) => DataItem(
    id: map['id'].toString(), 
    name: map['name'],
  )).toList();
  }

   // Delete item by id from database
  Future<int> deleteItem(String id) async {
    return await _repository.deleteData('tasks', id);
  }


}

