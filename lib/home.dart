import 'package:flutter/material.dart';
import 'package:geo/Authentication.dart';
import 'package:geo/driver.dart';
import 'package:geo/driverdetails.dart';
import 'package:geo/geofencing.dart';
import 'package:geo/history.dart';
import 'package:geo/user.dart';
import 'package:geo/userdetails.dart';


void main(){
  runApp(homeApp());
}

class homeApp extends StatefulWidget {
  const homeApp({Key? key}) : super(key: key);

  @override
  State<homeApp> createState() => _homeAppState();
}

class _homeAppState extends State<homeApp> {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;    //access width
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
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
        body:  GridView.count(
          childAspectRatio: 4/2,

          primary: false,
          // padding: const EdgeInsets.all(20),
          padding: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 0),
          crossAxisSpacing: 0.05,
          mainAxisSpacing: 0.5,
          crossAxisCount: 2,
          children: <Widget>[
            Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,MaterialPageRoute(builder: (context) =>const Student() ),);
                  },
                  child:Container(
                    margin: EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 30),

                    width: w*1.5,                     //width of screen
                    height: h*0.3,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage(
                              "assets/usericon.png"
                          ),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
                const Text("Add User",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),


            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,MaterialPageRoute(builder: (context) =>const student1()),);
                  },
                  child:Container(
                    margin: EdgeInsets.only(left: 30,right: 30,top: 35,bottom: 35),
                    width: w*1.5,                     //width of screen
                    height: h*0.3,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage(
                              "assets/usericon.png"
                          ),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
                const Text("View User Details",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),

            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,MaterialPageRoute(builder: (context) =>const driver() ),);
                  },
                  child:Container(
                    margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom:10),
                    width: w*1.5,                     //width of screen
                    height: h*0.3,
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                          image: AssetImage(
                              "assets/drivericon.png"
                          ),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
                const Text("Add Driver",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,MaterialPageRoute(builder: (context) =>const driver2()),);
                  },
                  child:Container(
                    margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                    width: w*1.5,                     //width of screen
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
                ),
                const Text("View Driver Details",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),

            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,MaterialPageRoute(builder: (context) =>const geo()),);
                  },
                  child:Container(
                    margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                    width: w*1.5,                     //width of screen
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
                ),
                const Text("Geofencing",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),

            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,MaterialPageRoute(builder: (context) =>const history() ),);
                  },
                  child:Container(
                    margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                    width: w*1.5,                     //width of screen
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
                ),
                const Text("History",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
              ],
            ),


          ],

        )





    );

  }
}


