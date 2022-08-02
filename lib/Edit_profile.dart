import 'package:canoe_app/profile_alertdialog.dart';
import 'package:canoe_app/signin.dart';
import 'package:flutter/material.dart';

import 'Services/api_services.dart';
import 'modal/user_profile_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    super.initState();
  }

 TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
 TextEditingController _phoneController = TextEditingController();
  TextEditingController _passController = TextEditingController();
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
                onTap: ()async{
                  UserProfileModel model = await userProfile();
                  showDialog(context: context,
                      builder:(BuildContext context){
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: profiledialog(context,model),
                        );
                      });
                },
                child: CircleAvatar(
                  radius: 20,
                  child: Image.asset('images/profile.jpg'),

                ),
              )
            ],
          ),
        ),
        leading:  IconButton(onPressed: ()=>Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)) ,
      ),

      body: FutureBuilder<UserProfileModel>(
        future: userProfile(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text("something went wrong"),
            );
          }
          if(snapshot.hasData){
            _nameController = TextEditingController(
                text: snapshot.data!.user.name
            );
            _emailController = TextEditingController(
              text: snapshot.data!.user.email
            );
            _phoneController = TextEditingController(
                text: snapshot.data!.user.phone
            );

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: 20,),

                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),

                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.93,

                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(snapshot.data!.user.email),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  // TextField(
                  //   controller: _emailController,
                  //   decoration: InputDecoration(
                  //       contentPadding: const EdgeInsets.all(12),
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10.0)
                  //       ),
                  //       hintText: 'Change Email Id',
                  //       hintStyle: TextStyle(
                  //         color: Colors.grey,
                  //       )
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _phoneController,
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
                    controller: _passController,
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
            );
          }
          return Center(child: CircularProgressIndicator());

        },
      ),




    );
  }
}
