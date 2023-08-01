import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geo/models/user.dart';
import 'package:geo/remotedata/firehelper1.dart';




class EditPage extends StatefulWidget {
  final userModel user;
  const EditPage({Key? key, required this.user}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController? _userid;
  TextEditingController? _studentname;
  TextEditingController? _parentname;
  TextEditingController? _phno;
  TextEditingController? _busno;
  TextEditingController? _loc;

  @override
  void initState() {
    _userid= TextEditingController(text: widget.user.userid);
    _studentname = TextEditingController(text: widget.user.studentname);
    _parentname= TextEditingController(text: widget.user.parentname);
    _phno=TextEditingController(text: widget.user.phno);
    _busno=TextEditingController(text: widget.user.busno);
    _loc=TextEditingController(text: widget.user.loc);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.yellow,
          title: Text("Edit"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller: _userid,
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: "userid"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _studentname,
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: "studentname"),
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _parentname,
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: "parentname"),
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _phno,
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: "phno"),
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _busno,
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: "busno"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _loc,
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: "loc"),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  FirestoreHelper1.update(userModel(userid: widget.user.userid, studentname:_studentname!.text, parentname: _parentname!.text,
                      phno: _phno!.text, busno: _busno!.text, loc: _loc!.text),).then((value) {
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow,
                  ),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Update",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



