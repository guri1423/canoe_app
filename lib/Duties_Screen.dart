import 'package:canoe_app/Services/api_services.dart';
import 'package:canoe_app/home.dart';
import 'package:canoe_app/modal/location_duties_model.dart';
import 'package:canoe_app/modal/update_boat_model.dart';

import 'package:canoe_app/profile_alertdialog.dart';

import 'package:flutter/material.dart';

import 'modal/user_profile_model.dart';







class DutiesScreen extends StatefulWidget {
  const DutiesScreen({Key? key}) : super(key: key);

  @override
  _DutiesScreenState createState() => _DutiesScreenState();
}

final List<bool> _selected = List.generate(50, (i) => false);
final List<bool> _selected1 = List.generate(50, (i) => false);
final List<bool> _selected2 = List.generate(50, (i) => false);
class _DutiesScreenState extends State<DutiesScreen> {


  bool checked=false;


  late Future<LocationDutiesModel> _future;

  @override

  void initState() {
    _future = locationPendingDuties();

    super.initState();
  }




  List<List>allList=[
    _selected,
    _selected1,
    _selected2
  ];

  String? boatNum ;
 String? boatInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "View Duties",
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    FutureBuilder<int?>(
                      future: pendingDuties() ,
                      builder: (context,snapshot){
                        if(snapshot.hasData){
                          return Text("Total Pending Duties: ${snapshot.data.toString()}",
                            style: TextStyle(
                              color: Color(0xff2d2d2d),
                              fontSize: 18,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),);
                        }
                        if(snapshot.hasError){
                          return
                          Text(
                          "Error" ,
                          style: TextStyle(
                            color: Color(0xff2d2d2d),
                            fontSize: 18,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                        );}
                        return CircularProgressIndicator();

                      },


                    ),
                  ],
                ),
              ),

        FutureBuilder<LocationDutiesModel>(
          future: locationPendingDuties() ,
          builder: (context,snapshot){
            if(snapshot.hasData){

            return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.location.length,
                itemBuilder: (context,index){


                  return Theme(
                    data:  ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      iconColor: Color(0xff6f6f6f),
                      title: Row(
                        children: [
                          ImageIcon(AssetImage("images/pinicon.png"),color: Colors.green,),
                          SizedBox(width: 15,),
                          Expanded(
                            child: Text( snapshot.data!.location[index].location!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Color(0xffd72027),
                                fontSize: 22,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w600,
                              ),),
                          ),
                          // Icon(Icons.arrow_forward_outlined),
                          // SizedBox(width: 8,),
                          // Text("LocationB",
                          //   style: TextStyle(
                          //     color: Color(0xffd72027),
                          //     fontSize: 22,
                          //     fontFamily: "Lato",
                          //     fontWeight: FontWeight.w600,
                          //   ),),
                        ],
                      ),
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff6f6f6f),
                                width: 0.2
                            ),

                          ),
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                          Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Pending Duties : ${snapshot.data!.location[index].pendingDuties}",
                          style: TextStyle(
                            color: Color(0xff4d4c4c),
                            fontSize: 14,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                            ],
                          ),

                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 130,
                              width: MediaQuery.of(context).size.width-22,
                              decoration: BoxDecoration(
                                  color: Color(0xfff3f3f3),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8)
                                  ),
                                  border: Border.all(
                                      color:  Color(0xffa0a0a0),
                                      width: 0.2
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8,right: 8,top: 10,bottom: 10),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20,
                                  mainAxisExtent: 40,
                                ),
                                    itemCount: snapshot.data!.location[index].duties!.length,
                                    itemBuilder: (context,index1) {
                                  return GestureDetector(
                                                                onTap: (){
                                                                  setState(() {
                                                                    boatNum= snapshot.data!.location[index].duties![index1].boatNumber!.number!;
                                                                    debugPrint(boatNum);

                                                                    if(allList[index][index1]== true){
                                                                      allList[index][index1]=false;
                                                                    }else{
                                                                      allList[index][index1]=true;
                                                                    }
                                                                    boatInfo =snapshot.data!.location[index].duties![index1].status!;
                                                                  checked =  checkStatus(snapshot.data!.location[index].duties![index1].status!);
                                                                  });
                                                                },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: allList[index][index1]?Colors.green:Color(0xffb0b0b0),
                                          width: allList[index][index1]?5:1
                                        ),
                                        color:  snapshot.data!.location[index].duties![index1].status=="Pending"?Colors.white:  allList[index][index1]?Color(0xffd72027):Color(0xffd72027)
                                        // color:  snapshot.data!.location[index].duty![index].status=="Pending"?Color(0xffd72027) :  allList[index][index1]?Colors.green:null
                                      ),
                                      child: Center(child: Text(snapshot.data!.location[index].duties![index1].boatNumber!.number!,
                                          style: TextStyle(
                                          color:  snapshot.data!.location[index].duties![index1].status=="Pending" ?Colors.black:Colors.white
                                        ),
                                      //   style: TextStyle(
                                      //   color:  snapshot.data!.location[index].duty![index].status=="Pending" ?Colors.white:Colors.black
                                      // ),
                                      )),
                                    ),
                                  );
                                    })
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );

                },
              );
            }
            if(snapshot.hasError){
              return Center(child:  Text("something went wrong"),);
            }
            return CircularProgressIndicator();
          },

        )



            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 199,
        height: 44,
        child:  FloatingActionButton(
          onPressed: () {
            showDialog(context: context,
                builder:(BuildContext context){
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      height: 180,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap:()=>Navigator.pop(context),
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: Color(0xffd72027),
                                          shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: Icon(Icons.close,color: Colors.white,size: 15,),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              checked?
                              "Confirm Pick Up":"Confirm Drop Off",

                              style: TextStyle(
                                color: Color(0xffd72027),
                                fontSize: 18,
                                fontFamily: 'Lato',
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              checked?
                              "Are you sure to Pick up": "Have You arrived at your destination" ,
                              style: TextStyle(
                                color: Color(0xff2d2d2d),
                                fontSize: 14,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 20,),
                            checked?GestureDetector(
                              onTap: (){
                                updateStatus(UpdateDutiesModel());
                                debugPrint(boatNum);
                                Navigator.pop(context);

                                if(checked==true){
                                  setState(() {
                                    checked=false;
                                  });
                                }else{
                                  setState(() {
                                    checked=true;
                                  });
                                }

                              },
                              child: Container(
                                width: 196,
                                height: 44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(41),
                                  color: Color(0xffd72027),
                                ),
                                child: Center(
                                  child: Text(
                                    "Confirm ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ):Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
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
                                                        onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));},
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
            width: 199,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(41),
              color: checked? Color(0xff5cae09):Color(0xffd72027),
            ),

            child: Center(
              child:Text(
                checked?"Pick Up":"DropOff",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,



    );
  }
}





bool checkStatus(String status){
  switch (status){
    case "Pending":
     return  true;
    case "Ongoing":
      return  false;
    default:
      return  false;
  }

}

