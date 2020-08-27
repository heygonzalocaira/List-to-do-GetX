import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:listtodo_get/controllers/ToDoController.dart';
import 'package:listtodo_get/models/To_do.dart';

class ToDoScreen extends StatelessWidget {
  final ToDoController toDoController = Get.find();
  final int index;

  ToDoScreen({this.index});
  @override
  Widget build(BuildContext context) {
    String text = '';
    if(! this.index.isNull){
      text = toDoController.todos[index].text;
    }
    TextEditingController textEditingController = TextEditingController(text: text);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child:Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "What do you want to accompish ?",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  child: Text("Cancel"),
                  color: Colors.red,
                  onPressed: (){
                    Get.back();
                  },
                ),
                RaisedButton(
                  child: Text((this.index.isNull)? 'Add': 'Edit'),
                  color: Colors.green,
                  onPressed: (){
                    if(this.index.isNull){
                      toDoController.todos.add(ToDo(text: textEditingController.text));
                    }else{
                      var editing = toDoController.todos[index];
                      editing.text = textEditingController.text;
                      toDoController.todos[index] = editing;
                    }
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
