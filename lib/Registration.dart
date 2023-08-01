import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geo/Authentication.dart';

import 'package:get/get.dart';


void main(){
  runApp(const regApp());
}
// ignore: camel_case_types
class regApp extends StatefulWidget {
  const regApp({Key? key}) : super(key: key);

  @override
  State<regApp> createState() => _regAppState();
}

// ignore: camel_case_types
class _regAppState extends State<regApp> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var emailNode = FocusNode();
  var passNode=FocusNode();
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
                image: AssetImage("assets/tm1regpage.png"),
                fit: BoxFit.cover,
              ),
            ),



            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 200,width: 300,),
                Container(
                  width: w, //width of screen
                  height: h * 0.3, //1/3rd height of the screen
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/login1.jpg"
                        ),
                        fit: BoxFit.cover
                    ),

                  ),
                ),
                SizedBox(
                  height: 5,
                ),


                Container(
                  margin: const EdgeInsets.only(left: 870,right: 20),
                  width: w*0.5,
                  // height:h* 0.5,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome To TrackMe",
                          style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),

                        Container( //shadow
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
                              focusNode: emailNode,
                              controller: emailController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(

                                  hintText: "Email ID",
                                  prefixIcon: const Icon(
                                    Icons.email, color: Colors.yellow,),
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
                          height: 10,
                        ),
                        Container( //shadow
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
                              focusNode: passNode,
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  prefixIcon: const Icon(Icons.password_rounded,
                                    color: Colors.yellow,),
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
                          height: 20,
                        ),
                        /* Row(
                      children: [
                        Expanded(child: Container(),),
                        Text(
                          "Forgot your Password?",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey[500],
                          ),
                        )
                      ],
                    ),*/

                      ]
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                GestureDetector(
                  onTap: () {
                    AuthController.instance.register(emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 850,),
                      width: w*0.1,                     //width of screen
                      height: h*0.05,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                            image: AssetImage(
                                "assets/button.jpg"
                            ),
                            fit: BoxFit.cover
                        ),

                      ),
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.only(left: 850,),
                  child:RichText(

                    text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        text: "Have an Account?",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[500],
                        )
                    ),
                  ),
                ),
                SizedBox(

                    height: h * 0.1
                ),




              ],
            ),
          ),
        ],
      ),
    );
  }
}
