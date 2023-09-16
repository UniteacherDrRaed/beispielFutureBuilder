import 'package:beispielfuturebuilder/Model/comment.dart';
import 'package:flutter/material.dart';

Widget displayCircularProgressIndicator(String textfordisplaying){
  return  Center(
    child: Container(
      color: Colors.yellow,
      child: Column(
        
        children: [
          Text(textfordisplaying),
          const CircularProgressIndicator(
            color: Colors.blue,           
          ),
        ],
      )
      )
      );
}

Widget displayErrorMessage(String message){
  return Center(
    child: Container(
      color: Colors.red,
      child: Text(message),
    ),
  );
}

Widget displayCommentsInListView(List<Comment> commentsList)=>
ListView.builder(
  itemCount: commentsList.length,
  itemBuilder:(context, index) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      color: Colors.pink.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(commentsList[index].id.toString(),
        style:const TextStyle(color: Colors.blue,fontSize: 20)),
        Text(commentsList[index].name),
        Text(commentsList[index].email),
        Text(commentsList[index].body),
      ]),
    );
  }
);
  