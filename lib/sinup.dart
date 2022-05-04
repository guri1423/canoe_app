import 'package:canoe_app/signin.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 100),
        child: Column(
          children: [
            Text('SignUp',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            )),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                child: Image.asset('images/image15.png'),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                hintText: 'Enter Your Name',
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
              hintText: 'Enter Your Email',
              hintStyle: TextStyle(
                color: Colors.grey
              )
            ),

          ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                hintText: 'Enter Your Password',
                suffixIcon: Icon(Icons.visibility),
                hintStyle: TextStyle(
                  color: Colors.grey
                )
              ),
            ),
            SizedBox(height: 70),
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
                  child: Text('Sign Up', style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),),
                ),
              ),
            ),


          ],


        ),
      ),
    );
  }
}
