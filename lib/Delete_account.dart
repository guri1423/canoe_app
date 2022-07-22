import 'package:canoe_app/Duties_Screen.dart';
import 'package:flutter/material.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  @override
  Widget build(BuildContext context) {
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
}
