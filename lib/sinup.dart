import 'package:canoe_app/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
   SignUp({Key? key}) : super(key: key);



  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _userController=TextEditingController();
  final TextEditingController _passController=TextEditingController();

  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  registration(BuildContext context)async{
    print(_emailController.text);
    print(_passController.text);
    print(_userController.text);

    await _firebaseAuth.createUserWithEmailAndPassword(email:_emailController.text , password:_passController.text).then((value) =>
        FirebaseFirestore.instance.collection('Users').doc(value.user!.uid)
            .set({ 'userid': value.user!.uid, 'UserName': _userController.text })).then((value)
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
    } );
  }

  printD(){
    print("done");
  }


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
              controller: _userController,

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
            controller: _emailController,
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
              controller: _passController,

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
                registration(context);
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signin()));
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
