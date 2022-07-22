
import 'package:canoe_app/Services/api_services.dart';
import 'package:canoe_app/modal/create_new_password.dart';
import 'package:canoe_app/signin.dart';
import 'package:flutter/material.dart';



class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}


class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _confirmpasswordController=TextEditingController();
  bool _showPassword = false;

  changePassword(CreateNewPasswordModal modal) async{
    bool? status = await newPassword(modal);
    if(status!){ print("Password changed");
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Signin()));

    }
    else{
      print("try again");
    }
  }

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
                    controller: _emailController,

                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        hintText: 'Enter email',

                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        hintText: 'New Password',
                        
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _confirmpasswordController,
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        hintText: 'Confirm Password',
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


                  SizedBox(height: 30),
                  GestureDetector(
                    onTap:(){
                      changePassword(CreateNewPasswordModal(
                        email: _emailController.text,
                        password: _passwordController.text,
                        confirmpassword: _confirmpasswordController.text
                      ));
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