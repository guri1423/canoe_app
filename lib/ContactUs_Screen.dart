import 'package:canoe_app/Services/api_services.dart';
import 'package:canoe_app/modal/enquiry_modal.dart';
import 'package:canoe_app/profile_alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _phoneController=TextEditingController();
  final TextEditingController _messageController=TextEditingController();

  registration(BuildContext context)async {
    print(_emailController.text);
    print(_nameController.text);
    print(_messageController.text);
  }
 userContactUs(Enquiry model) async{
    bool? status = await userEnquiry(Enquiry(
      name: _nameController.text ,
      phone: _phoneController.text,
      message: _messageController.text,
      email: _emailController.text,

    ));
    if (status!){
      Fluttertoast.showToast(msg: "your requested submitted");
      Navigator.pop(context);

    }
    else{
      print('Try again');
    }

 }

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
            padding: EdgeInsets.symmetric(horizontal: 24,vertical:50),
            child: Column(
                children: [

                  TextField(
                    controller: _nameController,
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
                    controller: _emailController,
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
                    controller: _phoneController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        hintText: 'Enter Your Phone no',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _messageController,
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
                      userContactUs(Enquiry(
                        email: _emailController.text,
                        name: _nameController.text,
                        message: _messageController.text,
                        phone: _phoneController.text
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
