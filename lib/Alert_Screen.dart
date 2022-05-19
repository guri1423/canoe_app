import 'package:canoe_app/profile_alertdialog.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "Alert",
                textAlign: TextAlign.left,
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
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                thickness: 0.5,
                color: Color(0xff6f6f6f) ,
              ),
              itemCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color:Color(0xffd72027),
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Lorem Ipsum is simply dummy text of the\nprinting.",
                        style: TextStyle(
                          color: Color(0xff2d2d2d),
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),

    );
  }
}

