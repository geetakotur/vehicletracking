
import 'package:flutter/material.dart';
import 'package:geo/editdriver.dart';
import 'package:geo/models/driver.dart';
import 'package:geo/remotedata/firehelper.dart';


void main(){
  runApp(driver2());
}

class driver2 extends StatefulWidget {
  const driver2({Key? key}) : super(key: key);

  @override
  State<driver2> createState() => _driver2State();
}

class _driver2State extends State<driver2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow,
        title: Text("Driver Details"),
      ),
      body: Column(
        children: [
          StreamBuilder<List<driverModel>>(
              stream: FirestoreHelper.read(),
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
                                        FirestoreHelper.delete(singleUser).then((value) {
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
                              title: Text("${singleUser.drivername}"),
                              subtitle: Column(
                                children:[
                                  Text("${singleUser.drphno}"),
                                  Text("${singleUser.drbusno}"),

                                ],
                              ),
                              trailing: InkWell(onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(driver: driverModel(drivername: singleUser.drivername,
                                  drphno: singleUser.drphno,
                                  driverid: singleUser.driverid,drbusno: singleUser.drbusno,),)));
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




