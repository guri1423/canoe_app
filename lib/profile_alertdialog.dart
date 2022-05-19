import 'package:canoe_app/ContactUs_Screen.dart';
import 'package:canoe_app/Delete_account.dart';
import 'package:canoe_app/Duty_history.dart';
import 'package:canoe_app/Edit_profile.dart';
import 'package:canoe_app/Logout.dart';
import 'package:flutter/material.dart';

import 'Duties_Screen.dart';

List<String>_text=[
  "Edit Profile",
  "Duty History",
  "Contact Us",
  "Delete Account",
  "Logout"
];
List<String>_image=[
  "images/edit.png",
  "images/duty.png",
  "images/cnt.png",
  "images/del.png",
  "images/del.png",
];
List<Widget>_widget=[
  EditProfile(),
  DutyHistory(),
  ContactUs(),
  DeleteAccount(),
  Logout(),


];

Widget profiledialog(BuildContext context){
  var style=  TextStyle(
    color: Color(0xff4e4e4e),
    fontSize: 18,
  );
  return Container(
    height: 700,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.close,size: 20,)),
          ],
        ),
        CircleAvatar(
          radius: 40,
        ),
        SizedBox(height: 25,),
        Text(
          "Jhon Doe",
          style: TextStyle(
            color: Color(0xff2d2d2d),
            fontSize: 20,
            fontFamily: "Lato",
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5,),
        Text(
          "jhondoe123@gmail.com",
          style: TextStyle(
            color: Color(0xff585858),
            fontSize: 18,
          ),
        ),
        SizedBox(height: 25,),
        Divider(
          thickness: 0.8,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return MaterialButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>_widget[index]));

                    if(index==3){
                      Navigator.pop(context);
                      showDialog(context: context,
                          builder:(BuildContext context){
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                height: 255,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap:()=>Navigator.pop(context),
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffd72027),
                                                    shape: BoxShape.circle
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.close,color: Colors.white,size: 15,),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Image.asset('images/deleteicon.png',
                                      height: 60,
                                        width: 60,
                                      ),
                                      SizedBox(height: 15,),
                                      Text(
                                        "Are You Sure?",
                                        style: TextStyle(
                                          color: Color(0xffd72027),
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Do you really want to delete your account ",
                                        style: TextStyle(
                                          color: Color(0xff2d2d2d),
                                          fontSize: 14,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (){

                                              },
                                              child: Container(
                                                width: 100,
                                                height: 44,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(41),
                                                  color: Color(0xff6f6f6f),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),

                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 100,
                                              height: 44,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(41),
                                                color: Color(0xffd72027),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    } else if (index==4){
                      Navigator.pop(context);
                      showDialog(context: context,
                          builder:(BuildContext context){
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                height: 180,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap:()=>Navigator.pop(context),
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffd72027),
                                                    shape: BoxShape.circle
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.close,color: Colors.white,size: 15,),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Are you Sure?",
                                        style: TextStyle(
                                          color: Color(0xffd72027),
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Do you really want to Logout",
                                        style: TextStyle(
                                          color: Color(0xff2d2d2d),
                                          fontSize: 14,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 25),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                },

                                              child: Container(
                                                width: 100,
                                                height: 44,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(41),
                                                  color: Color(0xff6f6f6f),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 100,
                                              height: 44,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(41),
                                                color: Color(0xffd72027),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Logout",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            );

                          });

                    }else{
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>_widget[index]));
                    }

                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ImageIcon(AssetImage(_image[index])),
                      ),

                      Text(_text[index],style: style,),
                    ],
                  ),
                ),
              );
            }),
        SizedBox(height: 15,),
        Divider(
          thickness: 0.8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Privacy Policy",
              style: TextStyle(
                color: Color(0xff808080),
                fontSize: 14,
              ),
            ),
            SizedBox(width: 10,),
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff818181),
              ),
            ),
            SizedBox(width: 10,),
            Text(
              "Terms of Service",
              style: TextStyle(
                color: Color(0xff808080),
                fontSize: 14,
              ),
            )
          ],
        ),


      ],
    ),
  );
}