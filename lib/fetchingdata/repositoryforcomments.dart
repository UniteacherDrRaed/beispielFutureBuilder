import 'dart:convert';
import 'package:beispielfuturebuilder/Model/comment.dart';

import 'package:http/http.dart' as http;
class FetchingComments{
  
  static Future<List<Comment>> fetchAllComments() async{
    const String commentsLink="https://jsonplaceholder.typicode.com/comments";
    final response=await http.get(Uri.parse(commentsLink));
    if(response.statusCode==200)
    {
      final List<dynamic> allcomments=json.decode(response.body);
      return allcomments.map((e) => Comment.fromJson(e)).toList();
    }
    else{
      throw Exception("failed to fetch all comments");
    } 
  }

 static Future<bool> addComment(String name,String email, String body) async{
  const String commentsLink="https://jsonplaceholder.typicode.com/comments";
  final response=await http.post(Uri.parse(commentsLink),  headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'body': body,
    }),
  );
  return (response.statusCode==201);

 }

 static Future<bool> deleteComment(int id) async {

 final response= await http.delete(Uri.parse("https://jsonplaceholder.typicode.com/comments/$id"),
 headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode==200)
  {
     return true;
  } else
  {
     throw Exception(" error");
  }
   
    
 }
}