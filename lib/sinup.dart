import 'dart:io';


import 'package:canoe_app/home.dart';
import 'package:canoe_app/modal/signup_modal.dart';
import 'package:canoe_app/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'Services/api_services.dart';

class SignUp extends StatefulWidget {
   SignUp({Key? key}) : super(key: key);



  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _userController=TextEditingController();
  final TextEditingController _passController=TextEditingController();
  final TextEditingController _phoneNoController=TextEditingController();

  // final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  // registration(context)async{
  //   print(_emailController.text);
  //   print(_passController.text);
  //   print(_userController.text);
  //   print(_phoneNoController.text);
  //   await signup(SignUpRequestModel(name: _userController.text, email: _emailController.text, phoneNo: _phoneNoController.text, password: _passController.text));
  //
  //   await _firebaseAuth.createUserWithEmailAndPassword(email:_emailController.text , password:_passController.text).then((value) =>
  //       FirebaseFirestore.instance.collection('Users').doc(value.user!.uid)
  //           .set({ 'userid': value.user!.uid, 'UserName': _userController.text })).then((value)
  //   {
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
  //   } );
  // }

  printD(){
    print("done");
  }
  bool _showPassword = false;
  File? _image;

  getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
      print(_image);
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
  userSignUp(Register model)async{

    bool ? status = await userRegister(model) ;

    if(status!){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
    }else{
      /// here you can add dialog box
      print("please try again");
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
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
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Image.asset('images/image15.png'),
                  ),
                ),

                GestureDetector(onTap: () {
                  showDialog(context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .end,
                                            children: [
                                              Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffd72027),
                                                  shape: BoxShape.circle,

                                                ),
                                                child: Icon(Icons.close,
                                                  color: Colors.white,
                                                  size: 15,),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(vertical: 5),
                                            child: Container(
                                              width: 289,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(4),
                                                color: Color(0xffd72027),
                                              ),
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    getImage();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Import from gallery",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontFamily: "Lato",
                                                      fontWeight: FontWeight
                                                          .w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(vertical: 5),
                                            child: Container(
                                              width: 289,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(4),
                                                color: Color(0xffd72027),
                                              ),
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    getImage1();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Import from Camera",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontFamily: "Lato",
                                                      fontWeight: FontWeight
                                                          .w600,
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
                  _image != null ? CircleAvatar(
                    radius: 50, backgroundImage: FileImage(_image!),) : Stack(
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
              SizedBox(height: 10),
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
                SizedBox(height: 10),
                TextField(
                  controller: _phoneNoController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      hintText: 'Enter Phone No',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      )
                  ),

                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passController,
                  obscureText: _showPassword,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    hintText: 'Enter Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        child: Icon(
                          _showPassword ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    hintStyle: TextStyle(
                      color: Colors.grey
                    )
                  ),
                ),
                SizedBox(height: 40),

                GestureDetector(
                  onTap:(){
                    userSignUp(Register(
                      name: _userController.text,
                      password: _passController.text,
                      email: _emailController.text,
                      phone: _phoneNoController.text,

                    ));
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
      ),
    );
  }
}
