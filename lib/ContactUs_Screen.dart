import 'package:canoe_app/profile_alertdialog.dart';
import 'package:flutter/material.dart';

import 'forgotpassword.dart';
import 'home.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "Contact Us",
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
        leading:  IconButton(onPressed: ()=>Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)) ,
      ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 100),
            child: Column(
                children: [

                  TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        hintText: 'Enter Your Name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        hintText: 'Enter Your Email',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        hintText: 'Enter Your Message',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        )
                    ),
                  ),

                  SizedBox(height: 30),
                  GestureDetector(
                    onTap:(){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
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
                        child: Text('Send', style: TextStyle(
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
