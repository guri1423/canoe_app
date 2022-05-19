import 'package:canoe_app/home.dart';
import 'package:canoe_app/signin.dart';
import 'package:flutter/material.dart';

import 'forgotpassword.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 100),
            child: Column(
                children: [
                  Text('Create New Password',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      )),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      child: Image.asset('images/image14.png'),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        hintText: 'New Password',
                        suffixIcon: Icon(Icons.visibility),
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
                        hintText: 'Confirm Password',
                        suffixIcon: Icon(Icons.visibility),
                        hintStyle: TextStyle(
                            color: Colors.grey
                        )
                    ),
                  ),
                  SizedBox(height: 20),


                  SizedBox(height: 30),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signin()));
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
                        child: Text('Done', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                      ),
                    ),
                  ),
                ]
            )
        )
    );
  }
}