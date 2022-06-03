import 'package:canoe_app/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'forgotpassword.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);


  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passController=TextEditingController();

  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  QuerySnapshot? searchSnapshot;
  String? uid;

  loginUser(BuildContext context)async{
    await _firebaseAuth.signInWithEmailAndPassword(email: _emailController.text, password: _passController.text)
        .then((value) {
      uid=value.user!.uid;
    });
    await _firestore.collection('Users').where("userid",isEqualTo:uid).get().then((value) {
      searchSnapshot=value;
    });
    print(searchSnapshot!.docs[0]["UserName"]);
    addUserNameToSF(searchSnapshot!.docs[0]["UserName"]);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
    Home()));

  }


  addUserNameToSF(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }


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
              controller: _emailController,
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
              controller: _passController,
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
          loginUser(context);
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
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
      ),
    ]
    )

        )
    );
  }
}
