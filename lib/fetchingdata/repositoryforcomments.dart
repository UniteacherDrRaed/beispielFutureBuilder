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
}