import 'package:beispielfuturebuilder/fetchingdata/repositoryforcomments.dart';
import 'package:beispielfuturebuilder/ui/componentsusedinfuturebuilder.dart';
import 'package:flutter/material.dart';

class KommentareSeite extends StatefulWidget {
  const KommentareSeite({super.key});

  @override
  State<KommentareSeite> createState() => _KommentareSeiteState();
}

class _KommentareSeiteState extends State<KommentareSeite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All comments"),
        backgroundColor: Colors.pink,
      ),
      body:Container(
        color:Colors.yellow,
        child: FutureBuilder(
          future: FetchingComments.fetchAllComments(), 
          builder: ((context, snapshot) {
            if(snapshot.hasError)
            {
              return displayErrorMessage("fail to fetch all comments");
            }
            else if(snapshot.hasData)
            {
              final  comments=snapshot.data;
              return displayCommentsInListView(comments!);
            }
      
            return displayCircularProgressIndicator("Warten Sie bitte");
          }
          )
          ),
      ) ,
    );
  }
}