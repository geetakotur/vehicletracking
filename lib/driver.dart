
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geo/Authentication.dart';
import 'package:geo/driverdetails.dart';
import 'package:geo/models/driver.dart';
import 'package:geo/remotedata/firehelper.dart';



void main(){
  runApp(driver());
}
class driver extends StatefulWidget {
  const driver({Key? key}) : super(key: key);

  @override
  State<driver> createState() => _driverState();
}

class _driverState extends State<driver> {

  var driveridController=TextEditingController();
  var drivernameController=TextEditingController();
  var drphnoController=TextEditingController();
  var drbusnoController=TextEditingController();
  late DatabaseReference dbRef;

  @override
  void initState(){
    super.initState();
    dbRef=FirebaseDatabase.instance.ref('user');
  }
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;    //access width
    double h=MediaQuery.of(context).size.height;   //access height
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.yellow,

        title: Image.asset('assets/tm2logo.png',fit:BoxFit.cover,height: 250,width: 90,),

        titleSpacing: 0.05,
        elevation: 10,
      ),

      drawer: Drawer(
        backgroundColor: Colors.black,
        child:
        ListView(
          children:[
            SizedBox(height:0.02 ,),
            GestureDetector(
              onTap: (){
                AuthController.instance.logout();
              },
              child:Container(
                margin: const EdgeInsets.only(left: 20,right: 20,top: 50,bottom: 700),
                width: w*0.2,                     //width of screen
                height: h*0.08,              //1/3rd height of the screen
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/button.jpg"
                      ),
                      fit: BoxFit.cover
                  ),

                ),
                child:const Center(
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body:Center(
        child:Column(

          children: [
            Container(
              margin: EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 30),

              width: w*0.5,                     //width of screen
              height: h*0.3,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    image: AssetImage(
                        "assets/drivericon.png"
                    ),
                    fit: BoxFit.cover
                ),
              ),
            ),

            const Text("Add Driver",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),

            Container(
                height: h*0.05,
                width: w*0.3,//shadow
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 7,
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                      )
                    ]
                ),
                child: TextField(

                  controller: drivernameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Driver Name",
                      hintText: " Add Driver Name",
                      prefixIcon: const Icon(
                        Icons.add, color: Colors.yellow,),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                )
            ),
            SizedBox(height: 20,),

            Container(
                height: h*0.05,
                width: w*0.3,///shadow
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 7,
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                      )
                    ]
                ),
                child: TextField(

                  controller: drphnoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Phone No",
                      hintText: " Add Phone No",
                      prefixIcon: const Icon(
                        Icons.add, color: Colors.yellow,),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                )
            ),
            SizedBox(height: 20,),

            Container(
                height: h*0.05,
                width: w*0.3,///shadow
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 7,
                          blurRadius: 10,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)
                      )
                    ]
                ),
                child: TextField(

                  controller: drbusnoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Bus No",
                      hintText: "Add Bus No",
                      prefixIcon: const Icon(
                        Icons.add, color: Colors.yellow,),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                )
            ),
            SizedBox(height: 20,),


            MaterialButton(

              onPressed:
                  () {

                //Map<String, dynamic> data={

                // 'Driver Name': drivernameController.text.toString(),
                // 'Phone No': driverpnoController.text.toString(),
                // 'Bus No': dbusnoController.text.toString(),

                // };



                //dbRef.child("student").push().set(data).then((value){

                //  });
                // _create();
                FirestoreHelper.create(driverModel(
                  driverid: driveridController.text.toString(),
                  drivername: drivernameController.text.toString(),
                  drphno: drphnoController.text.toString(),
                  drbusno: drbusnoController.text.toString(),
                ));
                Navigator.push(context, MaterialPageRoute(builder: (context) => const driver2()));

              },
              color: Colors.yellow,
              child: const Text(
                'Save', style: TextStyle(color: Colors.black),),
            ),

          ],
        ),
      ),
    );

  }
// Future _create() async{
//   final driverCollection=FirebaseFirestore.instance.collection("driver");
//   final driverdoc=driverCollection.doc();
//
//   await driverdoc.set({
//     'Driver Name': drivernameController.text.toString(),
//     'Phone No': driverpnoController.text.toString(),
//     'Bus No': dbusnoController.text.toString(),
//   }
//
//   );
//}
}
