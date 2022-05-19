import 'package:canoe_app/profile_alertdialog.dart';
import 'package:canoe_app/signin.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
                "Edit Profile",
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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
        child: CircleAvatar(
        radius: 30,
            ),


            ),

          ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  hintText: 'Change Name',
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
                  hintText: 'Change Email Id',
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
                  hintText: 'Change Phone number',
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
                  hintText: 'Change Password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap:(){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signin()));
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
                  child: Text('Save Changes', style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),




    );
  }
}
