import 'package:flutter/material.dart';


class DutyHistory extends StatefulWidget {
  const DutyHistory({Key? key}) : super(key: key);

  @override
  State<DutyHistory> createState() => _DutyHistoryState();
}

class _DutyHistoryState extends State<DutyHistory> {
  List<String>_date=[
    "April 21",
    "April 22",
    "April 23",
    "April 24",
    "April 25",
    "April 26",
    "April 27",
    "April 28",
    "April 29",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),
        ),
        title: Row(
          children: [
            Text(
              "Duties History",
              style: TextStyle(
                color: Color(0xff2d2d2d),
                fontSize: 20,
                fontFamily: "Lato",
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            Icon(Icons.calendar_today_outlined,size: 20,color: Colors.black,),
            SizedBox(width: 10,),

            CircleAvatar(
              radius: 20,

            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(

                height: 60,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: index==0?Color(0xffd72027):Color(0xfff5f5f5),
                            ),
                            child:
                            Center(child:
                            Text(index==0?"Total 50":_date[index-1],
                              style: TextStyle(
                                color: index==0?Colors.white:Color(0xffb1b1b1),
                                fontSize: 16,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w700,
                              ),)),
                          )
                      );
                    }),
              ),
            ),
            Divider(
              thickness: 0.7,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: Container(

                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xfff5f5f5),
                      ),
                      child:Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(

                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(
                                      width: 14,
                                      height: 14,
                                      color:Color(0xff058f1b),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "2.00 pm",
                              style: TextStyle(
                                color: Color(0xff057a13),
                                fontSize: 12,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
