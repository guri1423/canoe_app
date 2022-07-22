import 'package:canoe_app/Change_Password.dart';
import 'package:canoe_app/Services/api_services.dart';
import 'package:canoe_app/modal/forgot_password_modal.dart';
import 'package:canoe_app/otp.dart';
import 'package:flutter/material.dart';

class Forgot_pass extends StatefulWidget {
  const Forgot_pass({Key? key}) : super(key: key);

  @override
  State<Forgot_pass> createState() => _Forgot_passState();
}


class _Forgot_passState extends State<Forgot_pass> {

  final TextEditingController _email = TextEditingController();

  newPassword(ForgotPasswordModal modal) async{
    bool? status = await userforgotpassword(modal);
    if(status!){
      print("user verified");
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangePassword()));
    }else{
      print("try again later");
    }
  }

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
                    controller: _email,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        hintText: 'Enter Your Registered Email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap:(){
                      newPassword(ForgotPasswordModal(
                        email: _email.text,
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
                        child: Text('Submit', style: TextStyle(
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
