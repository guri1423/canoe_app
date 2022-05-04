import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Duties"),
        leading: Container(
          padding: EdgeInsets.all(15.0),
          width: 10.0,
          height: 10.0,
          decoration:  BoxDecoration(
            color: const Color(0xff7c94b6),
            borderRadius: BorderRadius.all( Radius.circular(50.0)),
            border:  Border.all(
              color: Colors.white,
              width: 1.0,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              print("Reloading...");
              setState(() {
              });
            },
          )
          
        ],

      ),

    );
  }
}
