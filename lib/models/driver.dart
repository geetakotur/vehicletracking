import 'package:cloud_firestore/cloud_firestore.dart';

class driverModel {
  final String? driverid;
  final String? drivername;
  final String? drphno;
  final String? drbusno;

  driverModel({this.driverid,this.drivername, this.drbusno, this.drphno});

  factory driverModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return driverModel(
      drivername: snapshot['drivername'],
      driverid: snapshot['driverid'],
      drphno: snapshot['drphno'],
      drbusno: snapshot['drbusno'],
    );
  }

  Map<String, dynamic> toJson() => {
    "drivername": drivername,
    "drphno": drphno,
    "drbusno": drbusno,
    "driverid":driverid,
  };
}