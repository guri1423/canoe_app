import 'package:canoe_app/Services/api_services.dart';
import 'package:canoe_app/modal/alert_modal.dart';
import 'package:canoe_app/profile_alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlertScreen extends StatefulWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}
 late String stringResponse;

class _AlertScreenState extends State<AlertScreen> {

  late Future<List<AlertModal>> _future;


  @override
  void initState() {
    _future=fetchAlert();
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
      body: FutureBuilder<List<AlertModal>>(future: _future,
      builder: (context,snapshot){
        if (snapshot.hasData) {
          return SingleChildScrollView(
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
                            height: 30,
                            width: 10,
                            decoration: BoxDecoration(
                                color:Color(0xffd72027),
                                shape: BoxShape.circle
                            ),
                          ),
                          SizedBox(width: 20,),

                        ],
                      ),
                    );
                  }),
            ),
          );
        }
        else if(snapshot.hasError){
          return Center(child: Text(
            "${snapshot.error}"
          ),
          );
        }
        return Center(child: CircularProgressIndicator(),);
      },
      )

    );
  }
}

