import 'package:beispielfuturebuilder/fetchingdata/repositoryforcomments.dart';
import 'package:beispielfuturebuilder/ui/componentsusedinfuturebuilder.dart';
import 'package:flutter/material.dart';

class KommentareSeite extends StatefulWidget {
  const KommentareSeite({super.key});

  @override
  State<KommentareSeite> createState() => _KommentareSeiteState();
}

class _KommentareSeiteState extends State<KommentareSeite> {
 final TextEditingController _nameController=TextEditingController();
 final TextEditingController _emaillController=TextEditingController();
 final TextEditingController _bodyController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Center(child:  Text("All comments")),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context,
             builder: ((context) {
               return AlertDialog(
                icon: const Icon(Icons.add_comment),
                iconColor: Colors.red,
                title: const Text("Add a Comment"),
                content: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                     TextField(
                      controller: _emaillController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                     TextField(
                      controller: _bodyController,
                      decoration: InputDecoration(
                        hintText: 'Body',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  Row(children: [
                    Expanded(
                      child: OutlinedButton(onPressed: (){
                      FetchingComments.addComment(
                        _nameController.text, 
                        _emaillController.text,
                         _bodyController.text);
                         Navigator.pop(context);
                         _nameController.text="";
                         _emaillController.text="";
                         _bodyController.text="";
                         ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content:  Text("Comment added successfuly")));
                      },
                    child: const Text("add")),
                    ),
                  const SizedBox(
                      width: 10,
                    ),
                   Expanded(
                     child: OutlinedButton(onPressed: (){
                      Navigator.pop(context);
                     },
                     child: const Text("Cancel")),
                   )
                  ],)
                  ],
                ),
               );
             }));
          }, 
          icon: const  Icon(Icons.add_comment))
        ],
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