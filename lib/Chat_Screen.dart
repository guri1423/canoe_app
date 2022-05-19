import 'package:canoe_app/profile_alertdialog.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  List<Widget>_chat=[
    Row(
      children: [

        SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(22), ),
            color: Color(0xffefefef),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply dummy\ntext of the printing",
                style: TextStyle(
                  color: Color(0xff2d2d2d),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(22), bottomRight: Radius.circular(0), ),
            color:Color(0xffd72027),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,

                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      children: [
        CircleAvatar(radius: 18,),
        SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(22), ),
            color: Color(0xffefefef),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply dummy\ntext of the printing",
                style: TextStyle(
                  color: Color(0xff2d2d2d),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(22), bottomRight: Radius.circular(0), ),
            color:Color(0xffd72027),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,

                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      children: [
        CircleAvatar(radius: 18,),
        SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(22), ),
            color: Color(0xffefefef),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply dummy\ntext of the printing",
                style: TextStyle(
                  color: Color(0xff2d2d2d),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(22), bottomRight: Radius.circular(0), ),
            color:Color(0xffd72027),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,

                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      children: [
        CircleAvatar(radius: 18,),
        SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(22), ),
            color: Color(0xffefefef),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply dummy\ntext of the printing",
                style: TextStyle(
                  color: Color(0xff2d2d2d),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(22), bottomRight: Radius.circular(0), ),
            color:Color(0xffd72027),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,

                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      children: [
        CircleAvatar(radius: 18,),
        SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(22), ),
            color: Color(0xffefefef),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply dummy\ntext of the printing",
                style: TextStyle(
                  color: Color(0xff2d2d2d),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(22), bottomRight: Radius.circular(0), ),
            color:Color(0xffd72027),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,

                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      children: [
        CircleAvatar(radius: 18,),
        SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(22), ),
            color: Color(0xffefefef),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply dummy\ntext of the printing",
                style: TextStyle(
                  color: Color(0xff2d2d2d),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(22), bottomRight: Radius.circular(0), ),
            color:Color(0xffd72027),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,

                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      children: [
        CircleAvatar(radius: 18,),
        SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(22), ),
            color: Color(0xffefefef),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply dummy\ntext of the printing",
                style: TextStyle(
                  color: Color(0xff2d2d2d),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(22), bottomRight: Radius.circular(0), ),
            color:Color(0xffd72027),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,

                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      children: [
        CircleAvatar(radius: 18,),
        SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(22), ),
            color: Color(0xffefefef),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply dummy\ntext of the printing",
                style: TextStyle(
                  color: Color(0xff2d2d2d),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22),
              bottomLeft: Radius.circular(22), bottomRight: Radius.circular(0), ),
            color:Color(0xffd72027),
          ),
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Lorem Ipsum is simply",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,

                ),
              ),
            ),
          ),
        )
      ],
    ),

  ];
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
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                  itemCount: _chat.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: _chat[index],
                    );
                  } ))
      ),


    );
  }
}

