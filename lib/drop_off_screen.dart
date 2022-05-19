import 'package:canoe_app/profile_alertdialog.dart';
import 'package:flutter/material.dart';


class DropOffScreen extends StatefulWidget {
  const DropOffScreen({Key? key}) : super(key: key);

  @override
  _DropOffScreenState createState() => _DropOffScreenState();
}

class _DropOffScreenState extends State<DropOffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Spacer(),
            Text(
              "Duties Selected",
              style: TextStyle(
                color: Color(0xff2d2d2d),
                fontSize: 20,
                fontFamily: "Lato",
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                showDialog(context: context,
                    builder:(BuildContext context){
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: profiledialog(context),
                      );
                    });
              },
              child: CircleAvatar(

                radius: 20,

              ),
            )
          ],
        ),
        leading:  IconButton(onPressed: ()=>Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)) ,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Row(
                children: [
                  Column(

                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        color: Color(0xffd72027),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0x66bbbbbc),
                        ),
                        child: Center(
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 0.50, ),
                              color: Color(0xff009aee),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      ImageIcon(AssetImage("images/pinicon.png"),color: Colors.green,size: 20,),

                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text:  "Unsinkable boat",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: "(Boat Name)",
                                style: TextStyle(
                                  color: Color(0xff848484),
                                  fontSize: 16,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ]

                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Pick up Location",
                        style: TextStyle(
                          color: Color(0xff7a7979),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 20,),

                      Text(
                        "Drop off Location",
                        style: TextStyle(
                          color: Color(0xff7a7979),
                          fontSize: 14,
                        ),
                      )

                    ],
                  )
                ],
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  showDialog(context: context,
                      builder:(BuildContext context){
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            height: 180,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Text(
                                    "Drop Off",
                                    style: TextStyle(
                                      color: Color(0xffd72027),
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    "Have You arrived at your destination",
                                    style: TextStyle(
                                      color: Color(0xff2d2d2d),
                                      fontSize: 14,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap:()=>Navigator.pop(context),
                                        child: Container(
                                          width: 108,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(41),
                                            color: Color(0xffb3b3b3),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Not Yet",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.pop(context);
                                          showDialog(context: context,
                                              builder:(BuildContext context){
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Container(
                                                    height: 300,
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Stack(
                                                            alignment: Alignment.center,
                                                            children: [
                                                              Image.asset("images/confirm.png",height: 150,width: 200,),
                                                              Container(
                                                                width: 58,
                                                                height: 58,
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  color: Color(0xff5cae08),
                                                                ),
                                                                child: Center(
                                                                  child: Icon(Icons.check,color: Colors.white,size: 25,),
                                                                ),
                                                              ),
                                                            ],
                                                          ),

                                                          Text(
                                                            "Awesome!",
                                                            style: TextStyle(
                                                              color: Color(0xff2d2d2d),
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                          SizedBox(height: 15,),
                                                          Text(
                                                            "Your ride has been completed.",
                                                            style: TextStyle(
                                                              color: Color(0xff2d2d2d),
                                                              fontSize: 14,
                                                              fontFamily: "Lato",
                                                              fontWeight: FontWeight.w300,
                                                            ),
                                                          ),
                                                          SizedBox(height: 15,),
                                                          GestureDetector(
                                                            onTap: ()=>Navigator.pop(context),
                                                            child: Container(
                                                              width: 240,
                                                              height: 35,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(41),
                                                                color: Color(0xff5cae08),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "OK",
                                                                  style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 14,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: Container(
                                          width: 108,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(41),
                                            color: Color(0xff5cae09),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Confirm ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  width: 292,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(41),
                    color: Color(0xff5cae09),
                  ),
                  child: Center(
                    child: Text(
                      "Drop Off",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                ),
              )

            ],
          ),
        ),
      ),

    );
  }
}