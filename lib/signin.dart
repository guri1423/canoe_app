import 'package:canoe_app/home.dart';
import 'package:flutter/material.dart';

import 'forgotpassword.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 100),
    child: Column(
    children: [
    Text('SignIn',
    style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold
    )),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                child: Image.asset('images/image16.png'),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  hintText: 'Enter Your Email',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )
              ),
            ),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    hintText: 'Enter Your Password',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    )
                ),
            ),
      SizedBox(height: 20),
      GestureDetector(
        onTap:(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Forgot_pass()));
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Center(
            child: Text('Forgot Password', style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),),
          ),
        ),
      ),
      SizedBox(height: 30),
      GestureDetector(
        onTap:(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30)
          ),
          height: 50,
          alignment: Alignment.center,
          width:MediaQuery.of(context).size.width,
          child: Center(
            child: Text('Sign In', style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),),
          ),
        ),
      ),]
    )
        ));}
}
