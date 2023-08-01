import 'package:flutter/material.dart';
import 'package:geo/models/driver.dart';
import 'package:geo/remotedata/firehelper.dart';


class EditPage extends StatefulWidget {
  final driverModel driver;
  const EditPage({Key? key, required this.driver}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController? _driverid;
  TextEditingController? _drivername;
  TextEditingController? _drphno;
  TextEditingController? _drbusno;

  @override
  void initState() {
    _driverid = TextEditingController(text: widget.driver.driverid);
    _drivername = TextEditingController(text: widget.driver.drivername);
    _drphno = TextEditingController(text: widget.driver.drphno);
    _drbusno = TextEditingController(text: widget.driver.drbusno);
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
                controller: _driverid,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "driverid"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _drivername,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "drivername"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _drphno,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "drphno"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _drbusno,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "drbusno"),
              ),
              SizedBox(
                height: 10,
              ),

              InkWell(
                onTap: () {
                  FirestoreHelper.update(driverModel(
                      driverid: widget.driver.driverid,
                      drivername: _drivername!.text,
                      drphno: _drphno!.text,
                      drbusno: _drbusno!.text),).then((value) {
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