

import 'package:flutter/material.dart';
import 'package:geo/edit.dart';
import 'package:geo/models/user.dart';
import 'package:geo/remotedata/firehelper1.dart';


void main(){
  runApp(student1());
}

class student1 extends StatefulWidget {
  const student1({Key? key}) : super(key: key);

  @override
  State<student1> createState() => _student1State();
}

class _student1State extends State<student1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow,
        title: Text("User Details"),
      ),
      body: Column(
        children: [
          StreamBuilder<List<userModel>>(
              stream: FirestoreHelper1.read(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("some error occured"),
                  );
                }
                if (snapshot.hasData) {
                  final userData = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: userData!.length,
                        itemBuilder: (context, index) {
                          final singleUser = userData[index];
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              onLongPress: () {
                                showDialog(context: context, builder: (context) {
                                  return AlertDialog(
                                    title: Text("Delete"),
                                    content: Text("are you sure you want to delete"),
                                    actions: [
                                      ElevatedButton(onPressed: () {
                                        FirestoreHelper1.delete(singleUser).then((value) {
                                          Navigator.pop(context);
                                        });
                                      }, child: Text("Delete"))
                                    ],
                                  );
                                });
                              },
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
                              ),
                              title: Text("${singleUser.studentname}"),
                              subtitle: Column(
                                children:[
                                  Text("${singleUser.parentname}"),
                                  Text("${singleUser.phno}"),
                                  Text("${singleUser.busno}"),
                                  Text("${singleUser.loc}"),
                                ],
                              ),
                              trailing: InkWell(onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(user: userModel(studentname: singleUser.studentname, parentname: singleUser.parentname,userid: singleUser.userid,phno: singleUser.phno,busno: singleUser.busno,loc: singleUser.loc),)));
                              },child: Icon(Icons.edit)),
                            ),
                          );
                        }),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })
        ],
      ),

    );
  }
}




