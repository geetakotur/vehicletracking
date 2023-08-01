import 'package:cloud_firestore/cloud_firestore.dart';

class userModel{

  late final String? userid;
  late final String? studentname;
  late final String? parentname;
  late final String? phno;
  late final String? busno;
  late final String? loc;

  userModel({this.userid,this.studentname,this.parentname,this.phno,this.busno,this.loc});

  factory userModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String, dynamic>;

    return userModel(
        userid: snapshot['userid'],
        studentname: snapshot['studentname'],
        parentname: snapshot['parentname'],
        phno: snapshot['phno'],
        busno: snapshot['busno'],
        loc: snapshot['loc']
    );

  }
  Map<String ,dynamic> toJson()=>{
    "userid":userid,
    "studentname":studentname,
    "parentname":parentname,
    "phno":phno,
    "busno":busno,
    "loc":loc
  };


}