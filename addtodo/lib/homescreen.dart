import 'package:addtodo/todo.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<ToDo> items = [];
  final toDoController = TextEditingController();

  void addItem(){
    ToDo newItem = ToDo(
        id: DateTime.now().second.toString(),
        toDoText: toDoController.text.trim(),
        isDone: false
    );
    toDoController.clear();
    setState(() {
      items.add(newItem);
    });
  }

  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu,color: tdBlack,size: 30),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/avatar.png'),
            ),
          )
        ],
      ),
    );
  }
  Widget searchBox(){
     return Container(
       padding: const EdgeInsets.symmetric(horizontal: 15),
       decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(20)
       ),
       child: const TextField(
         decoration: InputDecoration(
           contentPadding: EdgeInsets.all(0),
           prefixIcon: Icon(Icons.search,color: tdBlack,size: 20),
           prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
           border: InputBorder.none,
           hintText: 'Search',
           hintStyle: TextStyle(color: tdGrey)
         ),
       ),
     );
  }
  Widget buildToDoItem(ToDo toDo){
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
            toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdOrange,
        ),
        title: Text(
          toDo.toDoText,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: toDo.isDone ? TextDecoration.lineThrough : null
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20,bottom: 20),
                          child: const Text('All ToDos',
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500)
                          ),
                        ),
                        for(ToDo item in items.reversed)
                          buildToDoItem(item)
                      ],
                    )
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextField(
                        controller: toDoController,
                        decoration: const InputDecoration(
                          hintText: 'Add a new todo item',
                          border: InputBorder.none
                        ),
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20,right: 20),
                  child: ElevatedButton(
                    onPressed: ()=> addItem(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdOrange,
                      minimumSize: const Size(65,65),
                      elevation: 10
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
