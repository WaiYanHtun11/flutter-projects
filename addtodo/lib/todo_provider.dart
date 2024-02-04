import 'package:addtodo/todo.dart';
import 'package:flutter/cupertino.dart';

class ToDoProvider with ChangeNotifier{
  List<ToDo> items = [];

  void addItem(ToDo toDo){
    items.add(toDo);
    notifyListeners();
  }

  void deleteItem(ToDo toDo){
    items.remove(toDo);
    notifyListeners();
  }

}