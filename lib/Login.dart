import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geo/Authentication.dart';
import 'package:geo/Registration.dart';
import 'package:get/get.dart';



void main(){
  runApp(const loginApp());
}
// ignore: camel_case_types
class loginApp extends StatefulWidget {
  const loginApp({Key? key}) : super(key: key);

  @override
  State<loginApp> createState() => _loginAppState();
}

// ignore: camel_case_types
class _loginAppState extends State<loginApp> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    double w=MediaQuery.of(context).size.width;    //access width
    double h=MediaQuery.of(context).size.height;   //access height
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(

        children: [
          Container(
            //  margin: const EdgeInsets.only(right: 20),
            width: w,
            height: h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/tmintropage.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200,width: 300,),
                Container(
                  margin: const EdgeInsets.only(left: 870,),
                  width: w*0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Hello",
                        style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "Sign into your account",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey[500],
                        ),
                      ),
                      const SizedBox(
                        height: 40,width: 100,
                      ),

                      Container(
                          margin: const EdgeInsets.only(left: 100,right: 50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 7,
                                    blurRadius: 10,
                                    offset: const Offset(1,1),
                                    color: Colors.grey.withOpacity(0.2)
                                )
                              ]
                          ),
                          child:TextField(
                            controller: emailController,
                            decoration: InputDecoration(

                                hintText: "Email ID",
                                prefixIcon: const Icon(Icons.email,color: Colors.yellowAccent,),

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
                      const SizedBox(
                        height: 10,width: 100,
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 100,right: 50),
                          width: w*0.5,//shadow
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 7,
                                    blurRadius: 10,
                                    offset: const Offset(1,1),
                                    color: Colors.grey.withOpacity(0.2)
                                )
                              ]
                          ),
                          child:TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(

                                hintText: "Password",
                                prefixIcon: const Icon(Icons.password_rounded,color: Colors.yellowAccent,),
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
                      const SizedBox(
                        height: 20,width: 60,
                      ),
                      Row(
                        children: [
                          Expanded(child: Container(
                              margin: const EdgeInsets.only(left: 450,right: 20),
                              child: Text(
                                "Forgot your Password?",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[500],
                                ),
                              )
                          ),
                          ),
                          //Text(
                          //"Forgot your Password?",
                          //style: TextStyle(
                          //fontSize: 15,
                          //color: Colors.grey[500],
                        ],
                      ),
                      // ],
                      //)
                      //),
                      //  ],
                      //),


                      //),

                      const SizedBox(
                        height: 2,width: 200,
                      ),
                      GestureDetector(
                        onTap: (){
                          AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
                        },

                        child:Container(
                            margin: const EdgeInsets.only(left: 280,),
                            width: w*0.1,                     //width of screen
                            height: h*0.05,              //1/3rd height of the screen
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
                                "Sign in",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                        ),
                      ),
                      SizedBox(
                        height:h*0.01,
                      ),
                      Container(
                          height: h*0.05,
                          margin: const EdgeInsets.only(left: 0.5,right: 10,top: 5,bottom: 20),
                          child:RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(

                                  text: "Don't have an Account?",
                                  style: TextStyle(

                                    color: Colors.grey[500],
                                    fontSize: 20,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: " Create",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>const regApp())

                                    )
                                  ]
                              )
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}






