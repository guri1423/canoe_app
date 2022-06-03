import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final  TextEditingController _controller=TextEditingController();

  QuerySnapshot? searchSnapshot;


  sendMessage()async{
    FirebaseFirestore.instance.collection('ChatRoom').doc(Timestamp.now().toString()).set({
      "sendBy":name,
      "message":_controller.text,
      "createdOn":Timestamp.now().toString()
    });

  }
  String ? name;
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('username');
    });
    print(name);

  }

  @override
  void initState(){
    getStringValuesSF();

    FirebaseFirestore.instance.collection("ChatRoom").orderBy("time",descending: false).get().then((value) {
      chatRoomStream=value as Stream;
    });

    super.initState();
  }
  late Stream chatRoomStream;
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
                "Chat",
                style: TextStyle(
                  color: Color(0xff2d2d2d),
                  fontSize: 20,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              CircleAvatar(
                radius: 20,

              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("username:  "),
                Text(name!)
              ],
            ),

            SizedBox(height: 10,),
            chatRoomList(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Row(
                children: [
                  Expanded(child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffd72027)),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          border: InputBorder.none
                      ),
                    ),
                  )),
                  SizedBox(width: 5,),
                  ElevatedButton(onPressed: (){
                    // logOut();
                    sendMessage();
                    _controller.clear();
                  }, child:Text("Send")
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chatRoomList(){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("ChatRoom").snapshots(),
      builder: (context,snapshot){
        return snapshot.hasData ?
        Expanded(
          child:ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context,index){


                return snapshot.data!.docs[index]["sendBy"]==name?Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            color:Color(0xffd72027),
                          ),
                          child: Text(snapshot.data!.docs[index]["message"],style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,

                          ),))
                    ],
                  ),
                ):Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.all(10),

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                color: Color(0xffefefef),
                              ),
                              child: Text(snapshot.data!.docs[index]["message"],style: TextStyle(
                                color: Color(0xff2d2d2d),
                                fontSize: 16,
                              ),)),
                          Text(snapshot.data!.docs[index]["sendBy"],style: TextStyle(
                            color: Colors.blue.withOpacity(0.8),
                          ),),
                          // Text(snapshot.data!.docs[index]["createdOn"].toString()
                          //     .replaceAll("Timestamp", "")
                          //     .replaceAll("(", "")
                          //     .replaceAll("seconds=", "")
                          //     .replaceAll("nano", "")
                          //     .replaceAll(")", ""))
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ):Container(
          child:Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 200),
              child: Text(
                "No Chat Found!!",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
