import 'package:canoe_app/modal/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:canoe_app/Duties_Screen.dart';
import 'package:canoe_app/Chat_Screen.dart';
import 'package:canoe_app/Alert_Screen.dart';
import 'package:canoe_app/Location_Screen.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<Widget>_body=[
  DutiesScreen(),
  LocationScreen(),
  ChatScreen(),
  AlertScreen(),
];
int selectindex=0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 40,
                  onPressed: (){
                    setState(() {
                      selectindex=0;
                    });
                  }, icon: ImageIcon(AssetImage("images/icon1.png",),
                  color: selectindex==0? Color(0xffd72027):Color(0xff6f6f6f),
                ),
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: (){
                    setState(() {
                      selectindex=1;
                    });
                  }, icon: ImageIcon(AssetImage("images/icon2.png",),
                  color: selectindex==1? Color(0xffd72027):Color(0xff6f6f6f),),),
                IconButton(
                  iconSize: 40,
                  onPressed: (){
                    setState(() {
                      selectindex=2;
                    });
                  }, icon: ImageIcon(AssetImage("images/icon3.png",),
                  color: selectindex==2? Color(0xffd72027):Color(0xff6f6f6f),),),
                IconButton(
                  iconSize: 40,
                  onPressed: (){
                    setState(() {
                      selectindex=3;
                    });
                  }, icon: ImageIcon(AssetImage("images/icon4.png",),
                  color: selectindex==3? Color(0xffd72027):Color(0xff6f6f6f),),),









              ],
            ),
          ),

        ),
      ),
      body: _body[selectindex],

    );
  }
}