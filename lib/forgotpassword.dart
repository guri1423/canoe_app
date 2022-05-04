import 'package:canoe_app/otp.dart';
import 'package:flutter/material.dart';

class Forgot_pass extends StatefulWidget {
  const Forgot_pass({Key? key}) : super(key: key);

  @override
  State<Forgot_pass> createState() => _Forgot_passState();
}

class _Forgot_passState extends State<Forgot_pass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 100),
            child: Column(
                children: [
                  Text('Forgot Password',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      )),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      child: Image.asset('images/image13.png'),
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
                  SizedBox(height: 70),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Send_Code()));
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
                        child: Text('Send a Code', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                      ),
                    ),
                  ),]
            )
        )

    );

  }
}
