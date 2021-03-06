import 'package:canoe_app/Change_Password.dart';
import 'package:flutter/material.dart';
import 'forgotpassword.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';


class Send_Code extends StatefulWidget {
  const Send_Code({Key? key}) : super(key: key);

  @override
  State<Send_Code> createState() => _Send_CodeState();
}

class _Send_CodeState extends State<Send_Code> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 100),
            child: Column(
                children: [
                  Text('Enter OTP',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      )),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      child: Image.asset('images/image11.png'),
                    ),
                  ),

                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      width:MediaQuery.of(context).size.width,
                      child: PinCodeTextField(
                        wrapAlignment: WrapAlignment.center,
                        maxLength: 5,
                        pinBoxHeight: 50,
                        pinBoxWidth: 50,
                        onTextChanged: (value){
                          print(value);
                        },


                      ),
                    ),
                  ),



                  SizedBox(height: 40),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
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
                        child: Text('Confirm', style: TextStyle(
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
