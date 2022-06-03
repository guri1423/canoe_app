import 'package:flutter/material.dart';

import 'Duties_Screen.dart';

class Logout extends StatefulWidget {
  const Logout(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  createAlertDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        alignment: Alignment.center,
        title: Text('Confirm Pick Up'),
        titleTextStyle: TextStyle(
          color: Color(0xffd72027),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        content: Text('Are you sure to Pickup'),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DutiesScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30)
              ),
              height: 44,
              alignment: Alignment.center,
              width:180,
              child: Center(
                child: Text('Confirm', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
              ),
            ),
          ),
        ],

      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(


    );
  }
}
