
import 'dart:async';

import 'package:canoe_app/Services/api_services.dart';
import 'package:canoe_app/Services/storage_services.dart';
import 'package:canoe_app/modal/get_message_model.dart';
import 'package:canoe_app/modal/message_modal.dart';
import 'package:canoe_app/profile_alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modal/user_profile_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller= TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final StorageServices _services = StorageServices();

  String? userName;

goToBottom()async{

  _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration:const Duration(milliseconds: 10),
      curve: Curves.fastOutSlowIn);

}

getName()async{
 await _services.getUserName().then((value) {
    setState(() {
      userName = value!;
      print(userName);
    });
  });
}
@override
  void initState() {
  getName();
    super.initState();
  }


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
                "Chat",
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
              ),

            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            StreamBuilder<dynamic>(
              stream: getMessage(),
                builder: (context,snapshot){
                if(snapshot.hasData){
                  return SizedBox(
                    height: MediaQuery.of(context).size.height*0.60,
                    width:  MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      controller: _scrollController,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.message.length,
                        itemBuilder: (context,index){
                        return userName == snapshot.data!.message[index].userName
                            ?Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 10,),


                            SizedBox(height: 5,),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Text(snapshot.data!.message[index].message ?? "",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:18,
                              ),),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  border: Border.all(color: Colors.blue)
                              ),),

                          ],
                        )
                            :Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            SizedBox(height: 5,),
                            Container(
                              padding: EdgeInsets.all(8),child: Text(snapshot.data!.message[index].message ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  border: Border.all(color: Colors.purple)
                              ),),
                            Text(snapshot.data!.message[index].userName?? "",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),),

                          ],
                        );
                        }),
                  );
                }else if(snapshot.hasError){
                  return Center(
                    child: Text("please try again later"),
                  );
                }

                return SizedBox(
                  height: MediaQuery.of(context).size.height*0.60,
                  width:  MediaQuery.of(context).size.width,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                    ),
                  )),
                  SizedBox(width: 5,),
                  ElevatedButton(

                      onPressed: ()async{
                    await sendMessageUser(SendMessageModal(
                      message: _controller.text,
                    ));
                    _controller.clear();
                   setState(() {
                     getMessage();
                   });
                  }, child: Text("Send")
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
