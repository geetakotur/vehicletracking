import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geo/models/driver.dart';


class FirestoreHelper {

  static Stream<List<driverModel>> read() {
    final driverCollection = FirebaseFirestore.instance.collection("drivers");
    return driverCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) =>
        driverModel.fromSnapshot(e)).toList());

  }

  static Future create(driverModel drivers) async {
    final driverCollection = FirebaseFirestore.instance.collection("drivers");

    final driverid = driverCollection.doc().id;
    final driverdoc = driverCollection.doc(driverid);

    final newUser = driverModel(
      driverid: driverid,
      drivername: drivers.drivername,
      drphno: drivers.drphno,
      drbusno: drivers.drbusno,
    ).toJson();

    try {
      await driverdoc.set(newUser);
    } catch (e) {
      print("some error occured $e");
    }
  }

  static Future update(driverModel drivers) async {
    final driverCollection = FirebaseFirestore.instance.collection("drivers");
    final driverdoc = driverCollection.doc(drivers.driverid);

    final newUser = driverModel(
      driverid: drivers.driverid,
      drivername: drivers.drivername,
      drphno: drivers.drphno,
      drbusno: drivers.drbusno,
    ).toJson();

    try {
      await driverdoc.update(newUser);
    } catch (e) {
      print("some error occured $e");
    }
  }

  static Future delete(driverModel drivers) async {
    final driverCollection = FirebaseFirestore.instance.collection("drivers");

    final driverdoc = driverCollection.doc(drivers.driverid).delete();

  }



}








