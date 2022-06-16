import 'dart:io';

import 'package:canoe_app/signin.dart';
import 'package:canoe_app/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

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
  File? _image;

  getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);

    });
  }
  // if (image ==null) return;
  // final imageTemporary = File(image!.path);
  getImage1() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 20),
                    child: GestureDetector( onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => WelcomeScreen()));
                    },

                        child: Icon(Icons.arrow_back_ios)),
                  ),
                ],
              ),
              Text('SIGN UP',
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

              GestureDetector(onTap: (){
                showDialog(context: context,
                    builder:(BuildContext context){
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: GestureDetector(
                                    onTap:()=>Navigator.pop(context),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                color: Color(0xffd72027),
                                                shape: BoxShape.circle,

                                              ),
                                              child: Icon(Icons.close,color: Colors.white,size: 15,),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 5),
                                          child: Container(
                                            width: 289,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: Color(0xff9c037f),
                                            ),
                                            child: Center(
                                              child: GestureDetector(onTap: (){
                                                getImage();
                                                Navigator.pop(context);
                                              },
                                                child: Text(
                                                  "Import from gallery",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontFamily: "Lato",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 5),
                                          child: Container(
                                            width: 289,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              color: Color(0xff9c037f),
                                            ),
                                            child: Center(
                                              child: GestureDetector(onTap: (){
                                                getImage1();
                                                Navigator.pop(context);
                                              },
                                                child: Text(
                                                  "Import from Camera",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontFamily: "Lato",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20,),

                              ],
                            ),
                          ),
                        ),
                      );
                    }
                );

              },
                child: Container(child:
                _image !=null ? CircleAvatar( radius: 50,backgroundImage: FileImage(_image!) ,): Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(radius: 50,),
                    Icon(Icons.add_a_photo_outlined
                      ,
                      color: Colors.white,),
                  ],
                )
                ),
              ),

              SizedBox(height: 30,),


              TextField(
                controller: _userController,

                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  hintText: 'Enter Full Name',
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
                hintText: 'Enter Email',
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
                  hintText: 'Enter Password',
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
                    color: Color(0xffd72027),
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
      ),
    );
  }
}
