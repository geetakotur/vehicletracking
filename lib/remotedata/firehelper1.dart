import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geo/models/user.dart';


class FirestoreHelper1 {

  static Stream<List<userModel>> read() {
    final userCollection = FirebaseFirestore.instance.collection("users");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => userModel.fromSnapshot(e)).toList());
  }

  static Future create(userModel users) async {
    final userCollection = FirebaseFirestore.instance.collection("users");
    final userid = userCollection.doc().id;
    final userdoc = userCollection.doc(userid);

    final newUser = userModel(
      userid: userid,
      studentname: users.studentname,
      parentname: users.parentname,
      phno: users.phno,
      busno: users.busno,
      loc: users.loc,).toJson();

    try {
      await userdoc.set(newUser);
    }
    catch (e) {
      print("error occured:$e");
    }
  }


  static Future update(userModel users) async {
    final userCollection = FirebaseFirestore.instance.collection("users");
    final userdoc = userCollection.doc(users.userid);

    final newUser = userModel(
      userid: users.userid,
      studentname: users.studentname,
      parentname: users.parentname,
      phno: users.phno,
      busno: users.busno,
      loc: users.loc,).toJson();

    try {
      await userdoc.update(newUser);
    } catch (e) {
      print("some error occured $e");
    }
  }

  static delete(userModel users) async {
    final userCollection = FirebaseFirestore.instance.collection("users");

    //  //final userdoc = userCollection.doc(user.userid).delete();
    userCollection.doc(users.userid).delete();
  }
}









