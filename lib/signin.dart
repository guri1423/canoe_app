import 'package:canoe_app/Services/api_services.dart';
import 'package:canoe_app/home.dart';
import 'package:canoe_app/modal/login_modal.dart';

import 'package:canoe_app/welcome_screen.dart';

import 'package:flutter/material.dart';


import 'package:canoe_app/Services/storage_services.dart';

import 'forgotpassword.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);



  @override
  State<Signin> createState() => _SigninState();
}


class _SigninState extends State<Signin> {
  bool _showPassword = false;
  bool _ischecked=false;
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passController=TextEditingController();


  final StorageServices _services = StorageServices();
  

  getEmailAndPass() async {

    _emailController.text = await _services.getEmail() ?? "";
    _passController.text = await _services.getPass() ?? "";
    debugPrint(await _services.getPass());
    if (await _services.getPass() != null) {
      setState(() {
        _ischecked = true;
      });
    } else {
      setState(() {
        _ischecked = false;
      });
    }
  }





  // final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  // final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  // QuerySnapshot? searchSnapshot;
  // String? uid;

  // loginUser(context)async{
  //   // await _firebaseAuth.signInWithEmailAndPassword(email: _emailController.text, password: _passController.text)
  //   //     .then((value) {
  //   //   uid=value.user!.uid;
  //   // });
  //   // await _firestore.collection('Users').where("userid",isEqualTo:uid).get().then((value) {
  //   //   searchSnapshot=value;
  //   // });
  //   // print(searchSnapshot!.docs[0]["UserName"]);
  //   // addUserNameToSF(searchSnapshot!.docs[0]["UserName"]);
  //   await login(LoginRequestModel(email: _emailController.text, password: _passController.text));
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>
  //   Home()));
  //
  // }

  //
  // addUserNameToSF(String username) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('username', username);
  // }
  userSignIn(LoginRequestModal model)async{
    bool ? status = await userLogin(model);
    if(status!){
      print("user logged in");
      _services.userLoggedIn();
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
    }else{
      print("try again later");
    }
  }

  @override
  void initState() {
    getEmailAndPass();
    super.initState();
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
                SizedBox(height: 30,),
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
              Text('LOG IN',
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
                            hintText: 'Enter Email',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        obscureText: _showPassword,
                        controller: _passController,
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
                SizedBox(height: 20),

                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                        fillColor: MaterialStateProperty.resolveWith<Color>((
                            states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Color(0xffd72027);
                          }
                          return Color(0xffd72027);
                        }),
                        value: _ischecked, onChanged: (value) {
                      _ischecked = !_ischecked;
                      setState(() {

                      });
                    }),
                    Text('Remember Me',
                    style: TextStyle(
                      fontSize: 17
                    ),),

                    Spacer(),

                    GestureDetector(onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => Forgot_pass()));
                    },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Forgot Password?',
                          style: TextStyle(
                            fontSize: 17,
                              color: Color(0xffd72027)
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),

                // GestureDetector(
                //   onTap:(){
                //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Forgot_pass()));
                //   },
                //   child: Container(
                //     height: 50,
                //     alignment: Alignment.center,
                //     child: Center(
                //       child: Text('Forgot Password', style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 17,
                //       ),),
                //     ),
                //   ),
                // ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap:() async {



                    if (_ischecked) {
                      print("saved");
                      await _services.storeEmail(_emailController.text);
                      await _services.storePass(_passController.text);
                    } else {
                      debugPrint("not remember");
                    }


                    userSignIn(LoginRequestModal(
                      email: _emailController.text,
                      password: _passController.text,

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
                      child: Text('Log In', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                    ),
                  ),
                ),
              ]
              ),
            ),
          ),
        )
    );
  }
}
