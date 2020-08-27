
import "package:flutter/material.dart";
import 'package:listtodo_get/controllers/ToDoController.dart';
import 'package:get/get.dart';
import 'package:listtodo_get/screens/ToDoScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ToDoController todoController = Get.put(ToDoController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx ToDo List"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.to(ToDoScreen());
        },
      ),
      body: Container(
        child: Obx(
          ()=> ListView.separated(
            itemBuilder: (context,index)=>ListTile(
              title: Text(
                todoController.todos[index].text,
                style: (todoController.todos[index].done)
                ? TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough)
                : TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color
                ),
              ),
            onTap: (){
              Get.to(
                ToDoScreen(
                  index: index,
                )
              );
            },
            leading: Checkbox(
              value: todoController.todos[index].done, 
              onChanged: (value){
                  var changed = todoController.todos[index];
                  changed.done = value;
                  todoController.todos[index] = changed;
                },
              ),
            trailing: Icon(Icons.chevron_right),
            ),
            separatorBuilder: (_, __)=>Divider(),
            itemCount: todoController.todos.length
          ),
        )
      ),
    );
  }
}